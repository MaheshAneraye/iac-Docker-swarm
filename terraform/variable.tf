variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "ap-south-1"
}

variable "ami" {
  description = "Ubuntu"
  default     = "ami-09b0a86a2c84101e1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "docker-swarm"
}

variable "key_path" {
  default = "/docker-swarm.pem"
}

variable "script_path" {
  default = "bash.sh"
}

variable "vpc_id" {
  default = "vpc-0278ddf91013aca44"
}
