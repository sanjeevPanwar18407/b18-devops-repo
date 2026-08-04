module "rgs" {
  source = "../object_resource/resource_group"
  rg = var.rgs
}

module "virtual_network" {
    depends_on = [module.rgs]
  source = "../object_resource/virtual_network"
  vnet = var.vnets
}
module "subnet" {
    depends_on = [module.virtual_network]
  source = "../object_resource/subnet"
  subnet = var.subnets
}

module "ip" {
    depends_on = [module.subnet ]
  source = "../object_resource/ip"
  ip = var.ip1
}
module "nics" {
  depends_on = [module.subnet,
  module.ip]
  source = "../object_resource/network_interface"
  nic = var.nicc
    vms = var.vms
}
