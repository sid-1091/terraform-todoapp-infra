resource "azurerm_mysql_database" "sql_db" {
  name                = var.sql_db_name
  server_id         = var.server_id
  collation           = "SQL_Latin1_General_CP1_C1_AS"
  license_type        = "LicenseIncluded"
  max_size_gb         = var.max_size_gb
  sku_name            = "S0"
  enclave_type        = "VBS"

  tags = var.tags
}