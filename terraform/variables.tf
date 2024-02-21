#
# Variables
#

variable "client_id" {
  description = "client_id"
  type        = string
}

variable "client_secret" {
  description = "client_secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "tenant_id"
  type        = string
}

variable "subscription_id" {
  description = "subscription_id"
  type        = string
}
