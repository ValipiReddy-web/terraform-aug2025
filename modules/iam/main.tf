resource "aws_iam_user" "this" {
  name = var.user_name
  path = "/"
}

variable "user_name" {}




