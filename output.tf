output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_username" {
  value = aws_db_instance.postgres.username
}

output "rds_database_name" {
  value = aws_db_instance.postgres.db_name
}