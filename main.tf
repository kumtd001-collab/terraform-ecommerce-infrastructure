resource "aws_s3_bucket" "product_assets" {
  bucket = "ecommerce-dev-product-assets-kumar"

  tags = {
    Environment = "dev"
    Purpose     = "product-assets"
  }
}