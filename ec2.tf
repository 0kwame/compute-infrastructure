resource "aws_instance" "video_server_1" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/data/userdata-video-server-1.txt")

  tags = {
    Name = "Video Server #1"
  }
}

resource "aws_instance" "video_server_2" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/data/userdata-video-server-2.txt")

  tags = {
    Name = "Video Server #2"
  }
}

resource "aws_instance" "web_server_1" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/data/userdata-web-server-1.txt")

  tags = {
    Name = "Web Server #1"
  }
}

resource "aws_instance" "web_server_2" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/data/userdata-web-server-2.txt")

  tags = {
    Name = "Web Server #2"
  }
}