terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_s3_bucket" "product_assets" {
  bucket = "${var.project_name}-${var.environment}-product-assets-kumar-02"


  tags = {
    Environment = var.environment
    Purpose     = "product-assets"
  }
}

resource "aws_iam_policy" "product_assets_access" {
    name = "${var.project_name}-${var.environment}-product-assets-access"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Action = [
                "s3:GetObject",
                "s3:PutObject"
            ]
            Resource = "${aws_s3_bucket.product_assets.arn}/*"
         }
        ]
      })
        tags = {
            Environment = var.environment
            Purpose     = "productassetsaccess"
        }
     }   