terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable resource_group_name {}
variable location {}
variable network_interface_id {}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s" // 1vcpu 1gib
  admin_username      = "adminuser"
  network_interface_ids = [
    var.network_interface_id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}
