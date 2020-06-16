provider "aws" {
  version = "~> 2.21"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "storage" {
  bucket = "${var.app_name}-storage"
  acl    = "private"
}

data "archive_file" "code" {
  type        = "zip"
  source_dir  = "${path.root}/lambdas"
  output_path = "${path.root}/dist/build.zip"
}

resource "aws_s3_bucket_object" "artefact_s3_object" {
  bucket = aws_s3_bucket.storage.id
  key    = "build.zip"
  source = "dist/build.zip"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("dist/build.zip")
}
