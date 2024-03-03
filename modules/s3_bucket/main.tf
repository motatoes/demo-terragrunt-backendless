resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "s3:*",
        Effect    = "Allow",
        Resource  = "${aws_s3_bucket.example_bucket.arn}/*",
        Principal = {"AWS": [var.iam_role_arn]}
      },
    ]
  })
}