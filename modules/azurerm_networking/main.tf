resource "azurerm_virtual_network" "network" {
  for_each            = var.network
  name                = each.value.network_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefixes
    }

  }
}


