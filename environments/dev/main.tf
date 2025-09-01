terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

 

# AWS Provider Configuration
provider "aws" {
  region  = "ap-south-1"
  
}



# EC2 Module
module "ec2_instance" {
  source        = "../../modules/ec2"
  instance_name = var.ec2_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
}

# S3 Module
module "s3_bucket" {
  source      = "../../modules/s3"
  bucket_name = var.s3_bucket_name
}

# IAM User Module
module "iam_user" {
  source    = "../../modules/iam"
  user_name = var.iam_user_name
}



