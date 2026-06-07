terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws     = { source = "hashicorp/aws", version = "~> 5.0" }
    archive = { source = "hashicorp/archive", version = "~> 2.0" }
  }
  backend "s3" {
    bucket  = "project-bedrock-tfstate-656867847125"
    key     = "project-bedrock/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = { Project = "karatu-2025-capstone" }
  }
}
