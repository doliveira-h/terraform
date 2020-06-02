variable "ami-name" {
  default = "ami-07ebfd5b3428b6f4d"
}

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
  profile = "default"
}

resource "aws_security_group" "sg-ssh" {
  name = "sg-ssh"
  description = "sg-ssh"
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
  security_group_id = aws_security_group.sg-ssh.id
}

resource "aws_security_group" "sg-http" {
  name = "sg-http"
  description = "sg-http"
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
  security_group_id = aws_security_group.sg-http.id
}

resource "aws_security_group_rule" "sgr-http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-http.id
}

resource "aws_instance" "apache" {
  ami = var.ami-name
  instance_type = "t2.micro"
  key_name = "aws-doliveira"
  tags = { 
    Name = "apache"
  }
  vpc_security_group_ids = ["${aws_security_group.sg-ssh.id}","${aws_security_group.sg-http.id}"]
  user_data = file("install-apache.sh")
}
