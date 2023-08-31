# professional-website-terraform-template
The files used to launch a website with Terraform are as follows:
1. main.tf — lists the providers (AWS, GitHub) and the versions used.
2. s3.tf — contains configuration of S3 buckets.
3. codepipeline.tf — contains configuration of CodePipeline.
4. cloudfront.tf — contains configuration for the CloudFront distribution.
5. route53.tf — contains configuration of DNS records.
6. variables.tf — defines variables used throughout the Terraform configuration files.
7. terraform.tfvars — attributes values to the variables which were defined in the variables.tf file.
8. s3_policy.json — defines a bucket policy template which is used for the web content S3 bucket. It requires no changes despite being a template.
9. codepipeline_policy.json — defines the policy attached to the IAM role assigned to CodePipeline.
