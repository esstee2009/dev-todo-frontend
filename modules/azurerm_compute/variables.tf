variable "compute" {
  type = map(object({
    nic_name = string
    location = string
    rg_name = string
    vnet_name = string
    subnet_name = string
    ip_configuration = object({
      name = string
      pip_address_allocation = string
    })
    compute_name = string
    size = string
    admin_username = string
    admin_password =  string  
  }))
}

variable "subnet_ids" {
  type = any
}