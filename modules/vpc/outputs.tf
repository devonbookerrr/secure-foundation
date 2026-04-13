output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the public subnet"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "ID of the private subnet"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "ID of the Internet Gateway"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.main.id
  description = "ID of the NAT Gateway"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of the public route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "ID of the private route table"
}

output "public_security_group_id" {
  value       = aws_security_group.public.id
  description = "ID of the public security group"
}

output "private_security_group_id" {
  value       = aws_security_group.private.id
  description = "ID of the private security group"
}
