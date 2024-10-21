provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "manager" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  user_data       = file("${var.script_path}")
  security_groups = ["${aws_security_group.swarm_sg.name}"]

  tags = {
    Name = "manager"
  }

}

resource "aws_instance" "worker-1" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  user_data       = file("${var.script_path}")
  security_groups = ["${aws_security_group.swarm_sg.name}"]

  tags = {
    Name = "worker-1"
  }

}

resource "aws_instance" "worker-2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  user_data       = file("${var.script_path}")
  security_groups = ["${aws_security_group.swarm_sg.name}"]

  tags = {
    Name = "worker-2"
  }

}