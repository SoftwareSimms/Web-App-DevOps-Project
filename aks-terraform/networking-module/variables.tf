variable "resource_group_name" {
  description = "The name of the Azure Resource Group for networking resources."
  type        = string
  default     = "myResourceGroup"  # Replace with your default value
}

variable "location" {
  description = "The Azure region where networking resources will be deployed."
  type        = string
  default     = "East US"  # Replace with your default value
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
  default     = ["10.0.0.0/16"]  # Replace with your default value
}
