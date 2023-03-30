

terraform {
  source = "${include.envcommon.locals.base_source_url}"
}


include "root" {
  path = find_in_parent_folders()
}

locals {
  atlantis_autoplan = true
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/ec2.hcl"
  expose = true
}

