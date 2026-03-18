resource "azurerm_network_interface" "nic" {
  for_each            = var.compute
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id = var.subnet_ids[each.value.vnet_name][each.value.subnet_name]
    private_ip_address_allocation = each.value.ip_configuration.pip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.compute
  name                            = each.value.compute_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

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