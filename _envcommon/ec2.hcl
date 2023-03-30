terraform {
  source = "${local.base_source_url}"
}


locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the terraform block in the child terragrunt configurations.
  base_source_url = "../../../../provider/ec2"
}




inputs = {
  ec2_ami = "ami-0a72af05d27b49ccb"
  ec2_type = "t2.micro"
  ec2_tag = "test1"

}
