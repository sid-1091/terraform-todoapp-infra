resource "azurerm_mysql_server" "sql_server" {
  name                   = var.sql_server_nmae
  resource_group_name    = var.rg_name
  location               = var.location
  version                ="12.0"
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  minimum_tls_version    = "1.2"

  tags = var.tags

}