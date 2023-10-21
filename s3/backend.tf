terraform {
  backend "s3" {
    bucket         = "terraform-backend-s3-bucket-hassan"
    key            = "s3/s3-terraform.tfstate"
    region         = "us-east-1"
  }
}
