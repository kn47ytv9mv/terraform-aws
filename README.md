# terraform-aws

Self-bootstrapping root configuration. One `terraform apply` creates its own
S3 state backend and migrates into it — no manual backend setup, no prior
remote state.

This isn't a reusable module. It's applied directly, and holds whatever
additional resources you add to `resources.tf`.

## Usage

```sh
git clone https://github.com/kn47ytv9mv/terraform-aws.git
cd terraform-aws
terraform init
terraform apply
```

Resources are removed by deleting them from configuration and applying, not
with `terraform destroy` — a full destroy is refused by design. Removing the
backend itself (the bucket) is a manual cleanup step, done afterward, outside
Terraform.

## Requirements

| Name | Version |
|---|---|
| terraform | >= 1.11 |

The first apply adds a backend block to `terraform.tf`, on top of what's
already there. That block only takes effect for other clones and future runs
once it's committed.

## License

MIT — see [LICENSE.md](LICENSE.md).
