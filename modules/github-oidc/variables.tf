variable "name" {
  type = string
}

variable "github_repo" {
  type        = string
  description = "owner/repo allowed to assume the deploy role"
}

variable "ecr_repository_arn" {
  type = string
}

variable "ecs_service_arn" {
  type = string
}

variable "task_role_arns" {
  type        = list(string)
  description = "Execution + task roles the deploy role may pass to ECS"
}
