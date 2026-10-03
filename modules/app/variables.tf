variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_url" {
  type        = string
  description = "Public base URL, used by the cron API destination"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate for HTTPS; null serves plain HTTP (demo only)"
  default     = null
}

variable "image_tag" {
  type        = string
  description = "Initial image tag; later deploys come from CI"
  default     = "bootstrap"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "max_count" {
  type    = number
  default = 3
}

variable "environment" {
  type        = map(string)
  description = "Non-secret environment variables"
  default     = {}
}

variable "secret_keys" {
  type        = list(string)
  description = "Keys of the JSON app secret exposed to the container as env vars"
}
