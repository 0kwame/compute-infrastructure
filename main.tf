resource "aws_default_vpc" "vpc" {

  tags = {
    Name = "Default VPC"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_default_vpc.vpc.id

  tags = {
    Name = "gateway"
  }
}