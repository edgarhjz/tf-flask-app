terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-project1"
    key            = "tf-flask-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock-table"
  }
}

provider "aws" {
  region = var.aws_region
}