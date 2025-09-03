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

variable "ami_id" {
  description = "The AMI ID for the EC2 instance (Ubuntu Server 24.04 LTS)"
  type        = string
  default     = "ami-0360c520857e3138f"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
