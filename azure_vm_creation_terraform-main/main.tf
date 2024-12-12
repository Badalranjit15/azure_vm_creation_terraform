#provider "azurerm" {
#  features {}

#  client_id       = var.client_id
#  client_secret   = var.client_secret
#  subscription_id = var.subscription_id
#  tenant_id       = var.tenant_id
#}

provider "azurerm" {
  features {}
}

data "azurerm_virtual_network" "default" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "default" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.default.name
  resource_group_name  = data.azurerm_virtual_network.default.resource_group_name
}

resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.example.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}

