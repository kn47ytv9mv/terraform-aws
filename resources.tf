module "backend" {
  source = "kn47ytv9mv/s3/aws"
}

resource "terraform_data" "bootstrap" {
  depends_on = [module.backend]

  lifecycle {
    prevent_destroy = true
  }

  provisioner "local-exec" {
    command = "sh bootstrap.sh ${module.backend.bucket} ${module.backend.region}"
  }
}
