resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
  }
}

variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "key_name" {}
variable "instance_name" {}



