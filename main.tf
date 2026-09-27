terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
          }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "product_assets" {
  bucket = "terraform-ecommerce-infrastructure-kumar-assets"
}

