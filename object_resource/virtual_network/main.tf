
resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnet
  name = each.value.azurerm_virtual_network_name
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
  location = each.value.location
}

