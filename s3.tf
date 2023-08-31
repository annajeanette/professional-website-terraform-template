# S3 bucket for website.
resource "aws_s3_bucket" "portfolio" {
  bucket        = var.bucket_name
  tags          = var.common_tags
  force_destroy = true

}

# S3 bucket for codepipeline artifacts.
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket        = var.artifact_bucket_name
  tags          = var.common_tags
  force_destroy = true

}

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = templatefile("s3_policy.json", {
    cloud_front_distro_arn = aws_cloudfront_distribution.s3_distribution.arn,
    bucket                 = var.bucket_name
  })
}