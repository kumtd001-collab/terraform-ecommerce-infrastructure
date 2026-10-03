output "bucket_name" {
  description = "Name of the E-commerce product assets bucket"
  value       = aws_s3_bucket.product_assets.bucket
}

output "bucket_arn" {
  description = "ARN of the E-commerce product assets bucket"
  value       = aws_s3_bucket.product_assets.arn
}