resource "aws_s3_bucket" "terraform_lockstate" {
  bucket = "terraformstate009"
  versioning {
  enabled = true
  }
  acl    = "private"
  tags = {
    Name        = "terraformstate009"
    Environment = "Dev"
  }
}
