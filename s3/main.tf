resource "aws_s3_bucket" "s3_buckets" {
  for_each = toset(var.bucket_names)
  bucket =  each.value
  tags = var.default_tags
}
resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership" {
  for_each = toset(var.bucket_names)
  bucket = aws_s3_bucket.s3_buckets[each.key].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_ownership]
  for_each = toset(var.bucket_names)
  bucket = aws_s3_bucket.s3_buckets[each.key].id
  acl = var.bucket_acl
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_block_public_access" {
  for_each = toset(var.bucket_names)
  bucket = aws_s3_bucket.s3_buckets[each.key].id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
  for_each = toset(var.bucket_names)
  bucket = aws_s3_bucket.s3_buckets[each.key].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.encryption_type
    }
  }
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  for_each = toset(var.bucket_names)
  bucket = aws_s3_bucket.s3_buckets[each.key].id
  versioning_configuration {
    status = "Disabled"
  }
}