output "server_id" {
  description = "The ID of the SQL Server"
  value       = azurerm_mysql_server.sql_server.id
}