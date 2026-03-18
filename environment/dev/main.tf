module "rg" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.resource_group
}

module "network" {
  depends_on = [var.resource_group]
  source     = "../../modules/azurerm_networking"
  network    = var.network
}

module "compute" {
  depends_on = [var.network]
  source     = "../../modules/azurerm_compute"
  compute    = var.compute
  subnet_ids = module.network.subnet_ids
}
