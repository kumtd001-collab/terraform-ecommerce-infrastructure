output "current_region" {
  description = "AWS region detected by the Teeraform AWS Provider"
  value       =  data.aws_region.current.name
}