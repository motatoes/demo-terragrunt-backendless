module "iam_role" {
  source    = "../modules/iam_role"
  role_name = "s3_bucket_role_messaging_prod"
}

module "s3_bucket" {
  source       = "../modules/s3_bucket"
  bucket_name  = "demo-terragrunt-parallel-svc-messaging-prod"
  iam_role_arn = module.iam_role.role_arn
}
