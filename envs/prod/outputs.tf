output "alb_dns_name" {
  description = "Point the domain's CNAME / alias here"
  value       = module.app.alb_dns_name
}

output "ecr_repository_url" {
  value = module.app.ecr_repository_url
}

output "app_secret_arn" {
  description = "Fill with: aws secretsmanager put-secret-value --secret-id <arn> --secret-string file://app-secret.json"
  value       = module.app.app_secret_arn
}

output "db_endpoint" {
  value = module.database.endpoint
}

output "db_master_secret_arn" {
  value = module.database.master_user_secret_arn
}

output "github_deploy_role_arn" {
  value = module.github_oidc.deploy_role_arn
}
