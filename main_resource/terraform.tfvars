rgs = {
    rg1 = {
        name = "rg1"
        location = "westus2"
    }
     rg2 = {
        name = "rg2"
        location = "westus2"
    }
}

vnets = {
    vnet1 = {
        azurerm_virtual_network_name = "lab_net"
        resource_group_name = "rg1"
        location            = "westus2"
        address_space       = ["10.0.0.0/16"]

    }
}
  
subnets = {
    subnet1 = {
        subnet_name    = "subnet1"
  resource_group_name  = "rg1"
  virtual_network_name = "lab_net"
  address_prefixes     = ["10.0.0.0/24"]
    }
      subnet2 = {
        subnet_name    = "subnet2"
  resource_group_name  = "rg1"
  virtual_network_name = "lab_net"
  address_prefixes     = ["10.0.1.0/24"]
    }
}

ip1 = {

    
 ip11 = {
    ip_name  = "pip-ip"
    resource_group_name = "rg1"
    location = "westus2"    
    allocation_method = "Static"
}
ip12 = {
    ip_name  = "pip-ip1"
    resource_group_name = "rg1"
    location = "westus2"    
    allocation_method = "Static"
}
}
nicc = {
    vms1 = {
        nic_name    = "nic1"
        location    = "westus2"
resource_group_name = "rg1"
       subnet_name  =  "subnet1"
  virtual_network_name = "lab_net"
  ip_name             = "pip-ip"
    }
    vms2 = {
        nic_name    = "nic2"
        location    = "westus2"
resource_group_name = "rg1"
       subnet_name  =  "subnet2"
  virtual_network_name = "lab_net"
  ip_name             = "pip-ip1"
    }
}

vms = {
    vms1 = {
        azurerm_linux_virtual_machine = "vms1"
  resource_group_name = "rg1"
location              = "westus2"
  size                = "Standard_D2as_v5"
  admin_username      = "admin-linux"
  admin_password      = "123321@@sanpan"
  disable_password_authentication = false

    }
    vms2 = {
        azurerm_linux_virtual_machine = "Backend-machine"
  resource_group_name = "rg1"
location              = "westus2"
  size                = "Standard_D2as_v5"
  admin_username      = "admin-linux"
  admin_password      = "123321@@sanpan"
  disable_password_authentication = false

    }
}