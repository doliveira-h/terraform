

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
  profile = "default"
}

resource "aws_security_group" "sg_ssh" {
  name = "sg_ssh"
  description = "sg_ssh"
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group_rule" "sgr-ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_ssh.id
}

resource "aws_security_group" "sg_http" {
  name = "sg_http"
  description = "sg_http"
  tags = {
    Name = "http"
  }
}

resource "aws_security_group_rule" "sgr-internal" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_http.id
}

resource "aws_security_group_rule" "sgr-http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_http.id
}

resource "aws_instance" "apache" {
  ami = var.ami-name
  instance_type = var.instance_type
  key_name = var.key_name
  tags = { 
    Name = "apache"
  }
  vpc_security_group_ids = ["${aws_security_group.sg_ssh.id}","${aws_security_group.sg_http.id}"]
  user_data = file("install-apache.sh")
}
