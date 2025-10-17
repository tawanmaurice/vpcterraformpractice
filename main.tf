terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket = "tawan-demo-bucket-${random_id.suffix.hex}"
  tags = {
    Name    = "TawanDemo"
    Purpose = "FreshStartPractice"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
