# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# --- root/sydney_locals.tf ---

# locals {
#   sydney_security_groups_info = [
#     {
#       name        = "vpce-nonprod"
#       description = "Allow instances to get to SSM Systems Manager"
#       vpc_id      = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.id
#       from_port   = 443
#       to_port     = 443
#       protocol    = "tcp"
#       cidr_blocks = ["10.1.0.0/16"]
#     },
#     {
#       name        = "icmp-nonprod"
#       description = "ICMP acess from 10.0.0.0/8"
#       vpc_id      = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.id
#       from_port   = "-1"
#       to_port     = "-1"
#       protocol    = "icmp"
#       cidr_blocks = ["10.0.0.0/8"]
#     },
#     {
#       name        = "vpce-prod"
#       description = "Allow instances to get to SSM Systems Manager"
#       vpc_id      = module.sydney_vpcs["prod-vpc"].vpc_attributes.id
#       from_port   = 443
#       to_port     = 443
#       protocol    = "tcp"
#       cidr_blocks = ["10.0.0.0/16"]
#     },
#     {
#       name        = "icmp-prod"
#       description = "ICMP acess from 10.0.0.0/8"
#       vpc_id      = module.sydney_vpcs["prod-vpc"].vpc_attributes.id
#       from_port   = "-1"
#       to_port     = "-1"
#       protocol    = "icmp"
#       cidr_blocks = ["10.0.0.0/8"]
#     },
#     {
#       name        = "vpce-egress"
#       description = "Allow instances to get to SSM Systems Manager"
#       vpc_id      = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       from_port   = 443
#       to_port     = 443
#       protocol    = "tcp"
#       cidr_blocks = ["100.64.0.0/16"]
#     },
#     {
#       name        = "icmp-egress"
#       description = "ICMP acess from 10.0.0.0/8"
#       vpc_id      = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       from_port   = "-1"
#       to_port     = "-1"
#       protocol    = "icmp"
#       cidr_blocks = ["10.0.0.0/8"]
#     }
#   ]

#   sydney_vpc_endpoints_ssm = [
#     {
#       vpc_id             = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["nonprod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[0]}", "${module.cwan_components_sydney.security_groups_info[1]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["prod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["prod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[2]}", "${module.cwan_components_sydney.security_groups_info[3]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       subnet_ids         = module.cwan_components_sydney.public_subnets
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[4]}", "${module.cwan_components_sydney.security_groups_info[5]}"]
#     }
#   ]

#   sydney_vpc_endpoints_ssmmessages = [
#     {
#       vpc_id             = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["nonprod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[0]}", "${module.cwan_components_sydney.security_groups_info[1]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["prod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["prod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[2]}", "${module.cwan_components_sydney.security_groups_info[3]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       subnet_ids         = module.cwan_components_sydney.public_subnets
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[4]}", "${module.cwan_components_sydney.security_groups_info[5]}"]
#     }
#   ]

#   sydney_vpc_endpoints_ec2messages = [
#     {
#       vpc_id             = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["nonprod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[0]}", "${module.cwan_components_sydney.security_groups_info[1]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["prod-vpc"].vpc_attributes.id
#       subnet_ids         = values({ for k, v in module.sydney_vpcs["prod-vpc"].private_subnet_attributes_by_az : k => v.id })
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[2]}", "${module.cwan_components_sydney.security_groups_info[3]}"]
#     },
#     {
#       vpc_id             = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       subnet_ids         = module.cwan_components_sydney.public_subnets
#       security_group_ids = ["${module.cwan_components_sydney.security_groups_info[4]}", "${module.cwan_components_sydney.security_groups_info[5]}"]
#     }
#   ]

#   sydney_ec2_instances = [
#     {
#       subnet_id              = module.sydney_vpcs["nonprod-vpc"].private_subnet_attributes_by_az["ap-southeast-2a"].id
#       vpc_security_group_ids = ["${module.cwan_components_sydney.security_groups_info[0]}", "${module.cwan_components_sydney.security_groups_info[1]}"]
#       ec2_name               = "nonprod"
#     },
#     {
#       subnet_id              = module.sydney_vpcs["prod-vpc"].private_subnet_attributes_by_az["ap-southeast-2a"].id
#       vpc_security_group_ids = ["${module.cwan_components_sydney.security_groups_info[2]}", "${module.cwan_components_sydney.security_groups_info[3]}"]
#       ec2_name               = "prod"
#     },
#     {
#       subnet_id              = module.sydney_vpcs["egress-vpc"].private_subnet_attributes_by_az["ap-southeast-2a"].id
#       vpc_security_group_ids = ["${module.cwan_components_sydney.security_groups_info[4]}", "${module.cwan_components_sydney.security_groups_info[5]}"]
#       ec2_name               = "egress"
#     }
#   ]

#   sydney_firewall_subnets = [
#     {
#       name                    = "firewall-subnet-1"
#       vpc_id                  = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       cidr_block              = "100.64.16.0/28"
#       availability_zone       = "ap-southeast-2a"
#       map_public_ip_on_launch = false
#     },
#     {
#       name                    = "firewall-subnet-2"
#       vpc_id                  = module.sydney_vpcs["egress-vpc"].vpc_attributes.id
#       cidr_block              = "100.64.16.16/28"
#       availability_zone       = "ap-southeast-2b"
#       map_public_ip_on_launch = false
#     }
#   ]

#   sydney_core_nw_attachments = {
#     "nonprod-private" = {
#       vpc_id                     = module.sydney_vpcs["nonprod-vpc"].vpc_attributes.arn
#       subnet_ids                 = values({ for k, v in module.sydney_vpcs["nonprod-vpc"].private_subnet_attributes_by_az : k => v.arn })
#       private_route_tbl_ids      = values({ for k, v in module.sydney_vpcs["nonprod-vpc"].route_table_by_subnet_type.private : k => v.route_table_id })
#       private_routes_destination = "0.0.0.0/0"
#       tags = [
#         {
#           key   = "nonprod"
#           value = "cloudwan-segment"
#         }
#       ]
#     }
#     "prod-private" = {
#       vpc_id                     = module.sydney_vpcs["prod-vpc"].vpc_attributes.arn
#       subnet_ids                 = values({ for k, v in module.sydney_vpcs["prod-vpc"].private_subnet_attributes_by_az : k => v.arn })
#       private_route_tbl_ids      = values({ for k, v in module.sydney_vpcs["prod-vpc"].route_table_by_subnet_type.private : k => v.route_table_id })
#       private_routes_destination = "0.0.0.0/0"
#       tags = [
#         {
#           key   = "prod"
#           value = "cloudwan-segment"
#         }
#       ]
#     }
#     "egress-private" = {
#       vpc_id                     = module.sydney_vpcs["egress-vpc"].vpc_attributes.arn
#       subnet_ids                 = values({ for k, v in module.sydney_vpcs["egress-vpc"].private_subnet_attributes_by_az : k => v.arn })
#       private_route_tbl_ids      = values({ for k, v in module.sydney_vpcs["egress-vpc"].route_table_by_subnet_type.private : k => v.route_table_id })
#       private_routes_destination = "10.0.0.0/8"
#       tags = [
#         {
#           key   = "shared"
#           value = "cloudwan-segment"
#         }
#       ]
#     }
#   }
# }