variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "public_url" {
  type        = string
  description = "e.g. https://serwis.example.com"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate in the same region; null = HTTP only"
  default     = null
}

variable "github_repo" {
  type    = string
  default = "faceitall123qwe-hub/repair-shop-app"
}

variable "base_lat" {
  type = string
}

variable "base_lng" {
  type = string
}

variable "email_from" {
  type = string
}

variable "turnstile_site_key" {
  type    = string
  default = ""
}

variable "alert_email" {
  type = string
}

variable "monthly_budget_usd" {
  type    = string
  default = "80"
}

variable "deletion_protection" {
  type    = bool
  default = true
}
