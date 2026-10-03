terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
}
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "${var.aws_region}"
  map_public_ip_on_launch = true
  depends_on = [
    aws_vpc.main
  ]
  tags = {
    Name        = "ecommerce-${var.environment}-public-subnet"
    Environment = var.environment
    Purpose     = "ecommerce-public-subnet"
  }
}
resource "aws_security_group" "web" {
  name        = "ecommerce-${var.environment}-web-sg"
  description = "Security group for E commerce Application"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "ecommerce-${var.environment}-web-sg"
    Environment = var.environment
    Purpose     = "ecommerce-web"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-08e3b3155fc937a94"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  tags = {
    Name        = "ecommerce - ${var.environment}-web"
    Environment = var.environment
    Purpose     = "ecommerce-web"
  }
}