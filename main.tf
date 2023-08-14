provider "aws" {
    region = "us-east-1"  
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = "akm-s3-bucket"
  acl    = "private"

  tags = {
    Name = "akm-s3-bucket"
  }
}
