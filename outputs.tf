output "public_ips" {
  value = aws_instance.my_instance[*].public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}