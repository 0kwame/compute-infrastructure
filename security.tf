resource "aws_security_group" "alb_security_group" {
  name        = "MyALBSecurityGroup"
  description = "My ALB security group"
  vpc_id      = aws_default_vpc.vpc.id

  ingress {
    description = "ssh from development workstation"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.local_ip_address}/32"] 
  }

  ingress {
    description = "http from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  revoke_rules_on_delete = true

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyALBSecurityGroup"
  }
}