terraform {
  backend "s3" {
    bucket       = "9d13dd2e-e470-bc3a-00bf-96da556254df"
    region       = "us-east-1"
    key          = "terraform.tfstate"
    use_lockfile = true
  }
}

terraform {
  required_version = ">= 1.11"
}
