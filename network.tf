# Creating new network
resource "azurerm_virtual_network" "demo-vnet" {
  name                = "demo-vnet"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  # Creating subnets
 resource "azurerm_subnet" "web-subnet" {
     name = "web-subnet"
     resource_group_name  = azurerm_resource_group.DemoRG.name
     virtual_network_name = azurerm_virtual_network.demo-vnet.name
     address_prefix = "10.1.0.0"
 }

 resource "azurerm_subnet" "db-subnet" {
     name = "db-subnet"
     resource_group_name  = azurerm_resource_group.DemoRG.name
     virtual_network_name = azurerm_virtual_network.demo-vnet.name
     address_prefix = "10.2.0.0"
 }

 resource "azurerm_subnet" "app-subnet" {
     name = "app-subnet"
     resource_group_name  = azurerm_resource_group.DemoRG.name
     virtual_network_name = azurerm_virtual_network.demo-vnet.name
     addres_prefix = "10.3.0.0"
 }
}

# Testing with restore functionality

# Creating Virtual Network Interface Card

resource "azurerm_network_interface" "webnic" {
  name                = "webnic"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name

  ip_configuration {
  name                          = "internal"
  subnet_id                     = azurerm_subnet.webnic.id
  private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_network_interface" "dbnic" {
  name                = "dbnic"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name

  ip_configuration {
  name                          = "internal"
  subnet_id                     = azurerm_subnet.dbnic.id
  private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_network_interface" "appnic" {
  name                = "appnic"
  location            = azurerm_resource_group.DemoRG.location
  resource_group_name = azurerm_resource_group.DemoRG.name

  ip_configuration {
  name                          = "internal"
  subnet_id                     = azurerm_subnet.appnic.id
  private_ip_address_allocation = "Dynamic"
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