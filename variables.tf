variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "artifact_bucket_name" {
  type        = string
  description = "Codepipline artifact bucket name."
}

variable "connection_name" {
  type        = string
  description = "GitHub connection name."
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}

variable "github_repo" {
  type        = string
  description = "URL of GitHub Repo"
}

variable "repo_id" {
  type        = string
  description = "Full ID of GitHub repo."
}

variable "acm_cert_arn" {
  type        = string
  description = "ARN of TLS certificate managed by ACM."
}

variable "github_connection_arn" {
  type        = string
  description = "ARN of GitHub connection."
}