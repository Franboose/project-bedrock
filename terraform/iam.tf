resource "aws_iam_user" "dev_view" {
  name = "bedrock-dev-view"
  tags = {
    Name = "bedrock-dev-view"
  }
}

resource "aws_iam_user_policy_attachment" "read_only" {
  user       = aws_iam_user.dev_view.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_policy" "s3_put_object" {
  name = "bedrock-dev-view-s3-put"
  user = aws_iam_user.dev_view.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.assets.arn}/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "dev_view" {
  user = aws_iam_user.dev_view.name
}

resource "aws_iam_user_login_profile" "dev_view" {
  user                    = aws_iam_user.dev_view.name
  password_reset_required = false
}

resource "aws_eks_access_entry" "dev_view" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_user.dev_view.arn
  type          = "STANDARD"
  depends_on    = [module.eks]
  tags = {
    Name = "bedrock-dev-view-access-entry"
  }
}

resource "aws_eks_access_policy_association" "dev_view_view" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_user.dev_view.arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.dev_view]
}
