variable "aws_region" {
  description = "The AWS region to deploy the application"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "s3_bucket" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "tf-bucket-project1"
}
