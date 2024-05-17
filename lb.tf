resource "aws_lb" "lb" {
  name               = "MyALB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "MyALB"
  }
}

resource "aws_lb_target_group" "video_server_target_group" {
  name = "VideoTargets"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.vpc.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.lb]
}

resource "aws_lb_target_group" "web_server_target_group" {
  name = "WebTargets"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.vpc.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.lb]
}

resource "aws_lb_target_group_attachment" "video_target_group_attachment_1" {
  target_group_arn = aws_lb_target_group.video_server_target_group.arn
  target_id        = aws_instance.video_server_1.private_ip
}

resource "aws_lb_target_group_attachment" "video_target_group_attachment_2" {
  target_group_arn = aws_lb_target_group.video_server_target_group.arn
  target_id        = aws_instance.video_server_2.private_ip
}

resource "aws_lb_target_group_attachment" "web_target_group_attachment_1" {
  target_group_arn = aws_lb_target_group.web_server_target_group.arn
  target_id        = aws_instance.web_server_1.private_ip
}


resource "aws_lb_target_group_attachment" "web_target_group_attachment_2" {
  target_group_arn = aws_lb_target_group.web_server_target_group.arn
  target_id        = aws_instance.web_server_2.private_ip
}


resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

 default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server_target_group.arn
  }
}

resource "aws_lb_listener_rule" "video_server_listener_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority = 5

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.video_server_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/vid/*"]
    }
  }
}