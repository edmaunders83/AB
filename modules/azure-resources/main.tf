#  provider "azurerm" {
#    features {}
#  }

#Create a Resource Group

resource "azurerm_resource_group" "rg" {
  name     = var.azure_resource_group
  location = var.azure_location
 }

#Create a Virtual Network

resource "azurerm_virtual_network" "vnet_1" {
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.azure_vnet_name
  address_space       = [var.azure_vnet_cidr]
  location            = azurerm_resource_group.rg.location
}


# Create a Subnet (used for multiple subnets)

resource "azurerm_subnet" "subnet-1" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }
  address_prefixes     = each.value.azure_subnet_cidr
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  name                 = each.value.azure_subnet_name
  depends_on           = [azurerm_virtual_network.vnet_1]
}


# Create a Network Security Group

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_rdp"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}