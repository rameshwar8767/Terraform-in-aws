resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "terraform-demo-bucket"
  }
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-automate-key-josh"
  public_key = file("terra-automate-key.pub")
}

# VPC Default

resource "aws_default_vpc" "default" {}

# Security Group 

resource "aws_security_group" "my_security_group" {

  name        = "terra-security-group"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "terra-security-group"
  }
}

# Inbound & Outbount port rules



# HTTP
resource "aws_vpc_security_group_ingress_rule" "allow_http" {

  security_group_id = aws_security_group.my_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {

  security_group_id = aws_security_group.my_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}


# Outbound
resource "aws_vpc_security_group_egress_rule" "allow_all" {

  security_group_id = aws_security_group.my_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}


# EC2 Instances
resource "aws_instance" "my_instance" {

  count = 3

  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"

  key_name = aws_key_pair.my_key_pair.key_name

  vpc_security_group_ids = [
    aws_security_group.my_security_group.id
  ]

  # Install Nginx automatically
  user_data = file("userdata.sh")

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "terra-server-${count.index + 1}"
  }

  depends_on = [
    aws_key_pair.my_key_pair,
    aws_security_group.my_security_group
  ]
}