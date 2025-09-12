resource "azurerm_subnet" "bastion_subnet" {
    for_each = var.azure_bation
  name                 =  each.value.bastion_subnetname   #"AzureBastionSubnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_bastion_host" "bastion" {
    for_each = var.azure_bation
    name                = each.value.bastion_name
    location            = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
        name                 = "configuration"
        subnet_id            = azurerm_subnet.bastion_subnet[each.key].id
        public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
      
}
}




data "azurerm_public_ip" "pip" {
    for_each = var.azure_bation
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  
}




variable "azure_bation" {
    type = map(any)
  
}