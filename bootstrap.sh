set -e

if grep -q '"type": "s3"' .terraform/terraform.tfstate
then
  exit
fi

cat - terraform.tf <<HCL > .terraform.tf
terraform {
  backend "s3" {
    bucket       = "$1"
    region       = "$2"
    key          = "terraform.tfstate"
    use_lockfile = true
  }
}

HCL
mv .terraform.tf terraform.tf

terraform init -force-copy -input=false -lock=false -migrate-state

terraform import -input=false -lock=false terraform_data.bootstrap .
