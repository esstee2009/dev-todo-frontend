variable "network" {
  type = map(object({
    network_name  = string
    location      = string
    rg_name       = string
    address_space = list(string)

    subnet = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}
