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


# Creating a new resource group
resource "azurerm_resource_group" "DemoRG" {
    name = "DemoRG"
    location = "East US"
}

