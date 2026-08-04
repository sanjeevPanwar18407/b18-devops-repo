data "azurerm_subnet" "subnet" {
  for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "ips" {
  for_each = var.nic
  name                = each.value.ip_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_network_interface" "nics" {
    for_each = var.nic 
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.ips[each.key].id
  }
}



 

resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vms
  name                = each.value.azurerm_linux_virtual_machine
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [azurerm_network_interface.nics[each.key].id]

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}