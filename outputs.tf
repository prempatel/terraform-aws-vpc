output "vpc_attributes" {
  description = "VPC resource attributes. Full output of aws_vpc."
  value       = local.vpc
}

output "subnets" {
  description = "Map of subnets grouped by type with child map { az = cidr }."
  value       = module.calculate_subnets.subnets_by_type
  /* Example:
    subnets = {
       private = {
          us-east-1a = "10.0.0.0/24"
          us-east-1b = "10.0.1.0/24"
          us-east-1c = "10.0.2.0/24"
        }
      public  = {
          us-east-1a = "10.0.3.0/24"
          us-east-1b = "10.0.4.0/24"
          us-east-1c = "10.0.5.0/24"
        }
    }
  */
}

output "transit_gateway_attachment_id" {
  description = "Transit gateway attachment id."
  value       = try(aws_ec2_transit_gateway_vpc_attachment.tgw[0].id, null)
}

output "private_subnet_attributes_by_az" {
  description = "Map of all private subnets containing their attributes."
  value       = try(aws_subnet.private, null)
}

output "public_subnet_attributes_by_az" {
  description = "Map of all public subnets containing their attributes."
  value       = try(aws_subnet.public, null)
}

output "tgw_subnet_attributes_by_az" {
  description = "Map of all transit gateway subnets containing their attributes."
  value       = try(aws_subnet.tgw, null)
}
