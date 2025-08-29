# The VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "flask-app-vpc"
  }
}

# Create the subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "flask-app-public-subnet"
  }
}
