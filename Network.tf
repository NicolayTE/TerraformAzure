# Create a new resource group
resource "azurerm_resource_group" "rg-network" {
  name     = "RGNETWORKGITHUBACTIONS"
  location = "Norway East" # Change to your preferred Azure region
}

# Create a virtual network in the resource group
resource "azurerm_virtual_network" "vnet-githubactions" {
  name                = "VNETGIBHUBACTIONS"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-network.location
  resource_group_name = azurerm_resource_group.rg-network.name

  # Define a subnet inline within the VNet
  subnet {
    name           = "SUBNETGITHUBACTIONS"
    address_prefixes = ["10.0.1.0/24"]
  }
}
