provider "aws" {
    region = "us-east-1"  
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = "AKM_Terraform_Bucket"
  acl    = "private"

  tags = {
    Name = "AKMS3Bucket"
  }
}
