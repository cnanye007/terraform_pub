variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
}

variable "AWS_SECRET_KEY" {
  description = "secret access key"
  default = "EScnywTkj/75dK2b5MvmtFg/OoAnA1XdaYgPmneL"
}

variable "AWS_ACCESS_KEY" {
  description = "access key details"
  default = "AKIAY5V7XK53AAOK35DW"
}

variable "availability_zone" {
     type = string
     default = "us-east-1a"
}
