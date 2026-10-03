variable "name" {
  type        = string
  description = "Name prefix for all resources"
}

variable "cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.20.0.0/16"
}

variable "az_count" {
  type        = number
  description = "Number of availability zones (RDS subnet group and ALB need at least 2)"
  default     = 2

  validation {
    condition     = var.az_count >= 2 && var.az_count <= 3
    error_message = "az_count must be 2 or 3."
  }
}
