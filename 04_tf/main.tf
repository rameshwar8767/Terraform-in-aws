terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "dev"
  type = string
}

locals {
  bucket_name = "rameshwar-${var.environment}"
  vpc_name = "${var.environment}-VPC"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = var.environment
  }
}


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = local.vpc_name
    Environment= var.environment
  }
}

resource "aws_instance" "my_instance" {
  subnet_id = aws_subnet.sample.subnet_id
  tags = {
    Environment = "Dev"
    Name = "${var.environment}-Ec2_Instance"
  }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}