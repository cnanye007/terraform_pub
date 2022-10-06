variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
}

variable "AWS_SECRET_KEY" {
  description = "secret access key"
  default = ""
}

variable "AWS_ACCESS_KEY" {
  description = "access key details"
  default = ""
}

variable "availability_zone" {
     type = string
     default = "us-east-1a"
}
