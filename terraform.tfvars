domain_name          = "<domain.com>"
bucket_name          = "<domain.com>"
artifact_bucket_name = "<codepipeline-output-artifacts-bucket-name>"
connection_name      = "<github-connection-name>"

common_tags = {
  Project = "professional-website"
}

github_repo = "<your-website-content-github-repo-url-here>"

repo_id = "<github-username/repo-name>"

acm_cert_arn = "<tls-certificate-arn-from-acm-here>"

github_connection_arn = "<github-connection-arn-here>"
