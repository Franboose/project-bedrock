output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "cluster_name" {
  value = module.eks.cluster_name
}
output "region" {
  value = var.aws_region
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "assets_bucket_name" {
  value = aws_s3_bucket.assets.bucket
}
output "mysql_endpoint" {
  value = aws_db_instance.mysql.address
}
output "postgresql_endpoint" {
  value = aws_db_instance.postgresql.address
}
output "dynamodb_table_name" {
  value = aws_dynamodb_table.carts.name
}
output "dev_user_access_key_id" {
  value = aws_iam_access_key.dev_view.id
}
output "dev_user_secret_key" {
  value     = aws_iam_access_key.dev_view.secret
  sensitive = true
}
output "dev_user_console_password" {
  value     = aws_iam_user_login_profile.dev_view.password
  sensitive = true
}
output "console_login_url" {
  value = "https://713729539092.signin.aws.amazon.com/console"
}
