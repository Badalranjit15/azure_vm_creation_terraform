#variable "client_id" {
#  description = "Azure Client ID"
#}

#variable "client_secret" {
#  description = "Azure Client Secret"
#}

#variable "subscription_id" {
#  description = "Azure Subscription ID"
#}

#variable "tenant_id" {
#  description = "Azure Tenant ID"
#}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "bo-resource-group1"
}

variable "location" {
  description = "Azure region"
  default     = "Germany West Central"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  default     = "bo-vnet03"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "default"
}

variable "nic_name" {
  description = "Name of the network interface"
  default     = "terraform-nic"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "terraform-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  default     = "azureuser"
}

variable "admin_password" {
  description = "Administrator password for the VM"
  default     = "YourSecurePassword123!" # Change this in a secure environment
}

variable "image_publisher" {
  description = "Publisher of the image"
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the image"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the image"
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the image"
  default     = "latest"
}

