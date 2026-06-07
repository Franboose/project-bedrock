variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "cluster_name" {
  type    = string
  default = "project-bedrock-cluster"
}
variable "vpc_name" {
  type    = string
  default = "project-bedrock-vpc"
}
variable "student_id" {
  type    = string
  default = "alt-soe-025-3564"
}
variable "eks_version" {
  type    = string
  default = "1.34"
}
variable "node_instance_type" {
  type    = string
  default = "t3.small"
}
variable "db_master_username" {
  type    = string
  default = "adminuser"
}
variable "db_master_password" {
  type      = string
  sensitive = true
}
