output "vnet_id" {
  description = "ID of the previously created VNet"
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "ID of the control plane subnet within the VNet"
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "ID of the worker node subnet within the VNet"
  value       = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
  description = "Name of the Azure Resource Group where networking resources were provisioned"
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG)"
  value       = azurerm_network_security_group.aks_nsg.id
}
