resource "aws_iam_role" "codepipeline" {
  name = "codepipeline_portfolio_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_policy" "codepipeline" {
  name   = "codepipeline_portfolio_policy"
  policy = templatefile("codepipeline_policy.json", {})
}

resource "aws_iam_policy_attachment" "codepipeline_role" {
  name       = "attach_codepipeline_portfolio_policy"
  roles      = [aws_iam_role.codepipeline.name]
  policy_arn = aws_iam_policy.codepipeline.arn
}

resource "aws_codepipeline" "codepipeline" {
  name     = "portfolio-pipeline"
  role_arn = aws_iam_role.codepipeline.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.id
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github_connection_arn
        FullRepositoryId = var.repo_id
        BranchName       = "main"
        DetectChanges    = false
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        BucketName = aws_s3_bucket.portfolio.id
        Extract    = true
      }
    }
  }
}