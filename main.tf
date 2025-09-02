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

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "flask-app-igw"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "flask-app-public-rt"
  }
}

# Route table association
resource "aws_route_table_association" "as" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
