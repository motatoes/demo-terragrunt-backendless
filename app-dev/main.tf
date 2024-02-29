module {
  source = "../modules/load-balancer"
}

resource "aws_s3_bucket" "example" {
  bucket = "demo-terragrunt-parallel-app-d"
}
