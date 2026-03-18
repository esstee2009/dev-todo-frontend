resource_group = {
  rg1 = {
    rg_name  = "resource_group"
    location = "uk south"
  }

}

network = {
  vnet1 = {
    network_name  = "vnet1"
    location      = "uk south"
    rg_name       = "rg1"
    address_space = ["10.0.0.0/16"]

    subnet = {
      subnet1 = {
        subnet_name      = "frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }
}

compute = {
  vm1 = {
    nic_name    = "nic"
    location    = "uk south"
    rg_name     = "resource_group"
    subnet_name = "frontend_subnet"
    vnet_name   = "vnet1"
    ip_configuration = {
      name                   = "internal"
      pip_address_allocation = "Dynamic"
    }
    compute_name   = "frontend_vm"
    size           = "Standard_F2"
    admin_username = "stadmin"
    admin_password = "infiniti2019%"
  }
}
