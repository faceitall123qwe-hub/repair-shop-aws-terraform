terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Bucket created by ../../bootstrap. Native S3 locking (no DynamoDB table).
  backend "s3" {
    key          = "serwis/prod/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "serwis"
      Environment = "prod"
      ManagedBy   = "terraform"
    }
  }
}

locals {
  name = "serwis-prod"
}

module "network" {
  source = "../../modules/network"
  name   = local.name
}

module "app" {
  source = "../../modules/app"

  name               = local.name
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  public_url         = var.public_url
  certificate_arn    = var.certificate_arn

  environment = {
    NEXT_PUBLIC_SITE_URL           = var.public_url
    BASE_LAT                       = var.base_lat
    BASE_LNG                       = var.base_lng
    SERVICE_RADIUS_KM              = "50"
    EMAIL_FROM                     = var.email_from
    NEXT_PUBLIC_TURNSTILE_SITE_KEY = var.turnstile_site_key
  }

  secret_keys = [
    "DATABASE_URL",
    "SESSION_SECRET",
    "IP_HASH_SALT",
    "RESEND_API_KEY",
    "TELEGRAM_BOT_TOKEN",
    "TELEGRAM_CHAT_ID",
    "TELEGRAM_WEBHOOK_SECRET",
    "TURNSTILE_SECRET_KEY",
  ]
}

module "database" {
  source = "../../modules/database"

  name                  = local.name
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.private_subnet_ids
  app_security_group_id = module.app.app_security_group_id
  deletion_protection   = var.deletion_protection
}

module "github_oidc" {
  source = "../../modules/github-oidc"

  name               = local.name
  github_repo        = var.github_repo
  ecr_repository_arn = module.app.ecr_repository_arn
  ecs_service_arn    = module.app.service_arn
  task_role_arns     = module.app.task_role_arns
}
