resource "anypoint_bg" "my_new_bg" { 
    name = "YOUR_BG_NAME" 
    parent_organization_id = var.root_org 
    owner_id = data.anypoint_bg.root_org.owner_id 
    entitlements_createsuborgs = true 
    entitlements_createenvironments = true 
    entitlements_globaldeployment = true 
    entitlements_vcoresproduction_assigned = 0 
    entitlements_vcoressandbox_assigned = 0 
    entitlements_vcoresdesign_assigned = 0 
    entitlements_staticips_assigned = 0 
    entitlements_vpcs_assigned = 1 
    entitlements_loadbalancer_assigned = 0 
    entitlements_vpns_assigned = 1 
}

resource "anypoint_env" "env_dev" {
  org_id = anypoint_bg.my_new_bg.id
  name = "DEV"
  type = "sandbox"
}

resource "anypoint_env" "env_tst" {
  org_id = anypoint_bg.my_new_bg.id
  name = "TST"
  type = "sandbox"
}

resource "anypoint_env" "env_prd" {
  org_id = anypoint_bg.my_new_bg.id
  name = "PRD"
  type = "production"
}