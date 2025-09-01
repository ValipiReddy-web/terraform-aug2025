terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

#Shared storage for terraform state files
  backend "s3" {
    bucket         = "terraform-state-bucketsai-fresh"  #Get the state file from these here and update the state file from these here
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"  #this for state file locking
    profile        = "terraformprofile"
  }
}

# AWS Provider Configuration
provider "aws" {
  region  = "ap-south-1"
  profile = "terraformprofile"
}



# EC2 Module
module "ec2_instance" {
  source        = "./modules/ec2"
  instance_name = var.ec2_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
}

# S3 Module
module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}

# IAM User Module
module "iam_user" {
  source    = "./modules/iam"
  user_name = var.iam_user_name
}



