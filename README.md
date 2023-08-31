# professional-website-terraform-template

main.tf — lists the providers (AWS, GitHub) and the versions used.
s3.tf — contains configuration of S3 buckets.
codepipeline.tf — contains configuration of CodePipeline.
cloudfront.tf — contains configuration for the CloudFront distribution.
route53.tf — contains configuration of DNS records.
variables.tf — defines variables used throughout the Terraform configuration files.
terraform.tfvars — attributes values to the variables which were defined in the variables.tf file.
s3_policy.json — defines a bucket policy template which is used for the web content S3 bucket. It requires no changes despite being a template.
codepipeline_policy.json — defines the policy attached to the IAM role assigned to CodePipeline.
