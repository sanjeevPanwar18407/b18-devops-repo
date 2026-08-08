resource "azurerm_public_ip" "rgs" {
  for_each = var.ip 
  name = each.value.ip_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = each.value.allocation_method
}

