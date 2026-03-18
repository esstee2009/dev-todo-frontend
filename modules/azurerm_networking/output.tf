output "subnet_ids" {
  value = {
    for vnet_key, vnet in azurerm_virtual_network.network :
    vnet_key => {
      for s in vnet.subnet :
      s.name => s.id
    }
  }
}