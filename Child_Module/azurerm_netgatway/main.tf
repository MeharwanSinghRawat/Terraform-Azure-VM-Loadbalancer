resource "azurerm_nat_gateway" "natgatway" {
    for_each = var.natgateway

  name                = each.value.natgate_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku_name            = each.value.sku_name #
}

resource "azurerm_subnet_nat_gateway_association" "nat_assoc" {
  for_each = var.subnet
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.natgatway["ntgtway"].id
}


data "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


resource "azurerm_nat_gateway_public_ip_association" "nat_ip_assoc" {
  for_each = var.natgateway
  nat_gateway_id       = azurerm_nat_gateway.natgatway["ntgtway"].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}


data "azurerm_public_ip" "pip" {
    for_each = var.natgateway
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
    
}

variable "natgateway" {
  
}

variable "subnet" {
  type = map(any)

}