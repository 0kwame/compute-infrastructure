output "alb_security_group_id" {
    value = aws_security_group.alb_security_group.id
}

output "video_server_1_instance_id" {
    value = aws_instance.video_server_1.id
}

output "video_server_2_instance_id" {
    value = aws_instance.video_server_2.id
}

output "web_server_1_instance_id" {
    value = aws_instance.web_server_1.id
}

output "web_server_2_instance_id" {
    value = aws_instance.web_server_2.id
}

output "alb_arn" {
  value = aws_lb.lb.arn
}

output "alb_dns_name" {
    value = aws_lb.lb.dns_name
}

output "video_server_target_group_arn" {
    value = aws_lb_target_group.video_server_target_group.arn
}

output "web_server_target_group_arn" {
  value = aws_lb_target_group.web_server_target_group.arn
}

output "web_server_target_group_listener_arn" {
  value = aws_lb_listener.http_listener
}