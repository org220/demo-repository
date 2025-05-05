resource "aws_s3_bucket" "terraform-backend-bucket" {
 bucket = "backend-terrafrom-bucket"
 force_destroy = true
 tags = {
   Name        = "tf-bucket"
   Environment = "dev"
 }
}

resource "aws_s3_bucket_versioning" "versioning_bucket_enabled" {
 bucket = aws_s3_bucket.terraform-backend-bucket.id
 versioning_configuration {
   status = "Enabled"
 }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform-backend-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
