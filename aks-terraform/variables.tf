variable "client_id" {
  description = "The Client ID for the Azure Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the Azure Service Principal."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID for Azure."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID for Azure."
  type        = string
}
