resource "aws_subnet" "subnet_1" {
  vpc_id = aws_default_vpc.vpc.id
  cidr_block = "172.31.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "AZ1SUB"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_default_vpc.vpc.id
  cidr_block = "172.31.192.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "AZ2SUB"
  }
}
