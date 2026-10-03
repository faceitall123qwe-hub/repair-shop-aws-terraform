output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_zone_id" {
  value = aws_lb.this.zone_id
}

output "alb_arn_suffix" {
  value = aws_lb.this.arn_suffix
}

output "target_group_arn_suffix" {
  value = aws_lb_target_group.this.arn_suffix
}

output "ecr_repository_url" {
  value = aws_ecr_repository.this.repository_url
}

output "ecr_repository_arn" {
  value = aws_ecr_repository.this.arn
}

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "service_name" {
  value = aws_ecs_service.this.name
}

output "app_security_group_id" {
  value = aws_security_group.app.id
}

output "app_secret_arn" {
  value = aws_secretsmanager_secret.app.arn
}

output "task_role_arns" {
  value = [aws_iam_role.execution.arn, aws_iam_role.task.arn]
}

output "service_arn" {
  value = aws_ecs_service.this.id
}
