
terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.36.0 and above) recommends Terraform 1.1.4 or above.
  required_version = ">= 1.2.0"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.7.0"
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type

  tags = {
    Name = var.ec2_tag
  }
}
