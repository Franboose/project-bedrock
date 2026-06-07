resource "aws_secretsmanager_secret" "db_credentials" {
  name                    = "project-bedrock/db-credentials"
  recovery_window_in_days = 0
  tags                    = { Name = "project-bedrock-db-credentials" }
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    mysql_host        = aws_db_instance.mysql.address
    mysql_port        = "3306"
    mysql_database    = aws_db_instance.mysql.db_name
    mysql_username    = var.db_master_username
    mysql_password    = var.db_master_password
    postgres_host     = aws_db_instance.postgresql.address
    postgres_port     = "5432"
    postgres_database = aws_db_instance.postgresql.db_name
    postgres_username = var.db_master_username
    postgres_password = var.db_master_password
  })
}
