terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}


# Creating new network
resource "azurerm_virtual_network" "demo-vnet" {
  name                = "demo-vnet"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  # Creating subnets
 subnet {
     name = "web-subnet"
     address_prefix = "10.1.0.0/24"
 }

 subnet {
     name = "db-subnet"
     address_prefix = "10.2.0.0/24"
 }

 subnet {
     name = "app-subnet"
     addres_prefix = "10.3.0.0/24"
 }
}


# Creating Network Security Groups

resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name
}

resource "azurerm_network_security_group" "db-nsg" {
  name                = "db-nsg"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name
}

resource "azurerm_network_security_group" "app-nsg" {
  name                = "app-nsg"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name
}