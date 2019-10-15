terraform {
  required_version = ">=0.11.8"

  backend "s3" {
    bucket  = "smadikanti-terraform-expertise-tf-state"
    key     = "TerraformExpertise/common.tfstate"
    encrypt = true

    # tf state s3 bucket region
    region = "us-east-1"
  }
}