resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "tindd-re-sg" {
    # name = "tindd-re-sg"
  name        = var.sg-name
  description = "Inbound traffic"
  vpc_id      = aws_default_vpc.default.id
}

resource "aws_security_group_rule" "HTTP-traffic" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "SSH-traffic" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "prometheus" {
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "cadvisor" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "node-exporter" {
  type              = "ingress"
  from_port         = 9100
  to_port           = 9100
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "mysql-exporter" {
  type              = "ingress"
  from_port         = 9104
  to_port           = 9104
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "grafana" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "mysql-traffic" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}

resource "aws_security_group_rule" "alertmanager" {
  type              = "ingress"
  from_port         = 9093
  to_port           = 9093
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tindd-re-sg.id
}
output "sg-id" {
  value = aws_security_group.tindd-re-sg.id
}
output "vpc-id" {
  value = aws_default_vpc.default.id
}