output "bucket_names" {
  value = [for bucket_name in aws_s3_bucket.s3_buckets : bucket_name.bucket]
}