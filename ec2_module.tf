provider "aws" {
     region = "us-east-1"
}
module "webapps" {
     source = "https://github.com/cnanye007/Terraform.git"
}