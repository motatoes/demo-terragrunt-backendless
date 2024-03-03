resource "aws_iam_role" "example_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "example_policy" {
  name   = "${var.role_name}-policy"
  policy = file("${path.module}/policy.json")
}

resource "aws_iam_role_policy_attachment" "example_attach" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.example_policy.arn
}
