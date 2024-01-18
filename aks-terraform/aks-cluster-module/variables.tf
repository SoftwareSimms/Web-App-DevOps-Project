
# Terraform configuration file for defining input variables for AKS cluster module

# Input Variables

# Name of the AKS cluster
variable "aks_cluster_name" {
  description = "The name of the AKS cluster you wish to create."
  type        = string
}

# Azure region for AKS cluster deployment
variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
}

# DNS prefix for the AKS cluster
variable "dns_prefix" {
  description = "The DNS prefix of the AKS cluster."
  type        = string
}

# Kubernetes version for the AKS cluster
variable "kubernetes_version" {
  description = "The version of Kubernetes the cluster will use."
  type        = string
}

# Client ID for the service principal associated with the AKS cluster
variable "service_principal_client_id" {
  description = "The Client ID for the service principal associated with the AKS cluster."
  type        = string
}

# Client Secret for the service principal
variable "service_principal_secret" {
  description = "The Client Secret for the service principal."
  type        = string
}

# Networking Module Variables

# Name of the resource group in the networking module
variable "resource_group_name" {
  description = "Name of the Azure Resource Group where networking resources were provisioned."
  type        = string
}

# ID of the Virtual Network
variable "vnet_id" {
  description = "ID of the Virtual Network (VNet) created in the networking module."
  type        = string
}

# ID of the control plane subnet
variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet within the VNet, created in the networking module."
  type        = string
}

# ID of the worker node subnet
variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet within the VNet, created in the networking module."
  type        = string
}
