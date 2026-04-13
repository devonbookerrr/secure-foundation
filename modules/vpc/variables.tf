variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  validation {
    condition     = can(cidrnetmask(var.public_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
  validation {
    condition     = can(cidrnetmask(var.private_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "project_name" {
  type        = string
  description = "Project name used for tagging and naming"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources. Must include 'Environment' and 'Owner'."
  validation {
    condition     = contains(keys(var.tags), "Environment") && contains(keys(var.tags), "Owner")
    error_message = "tags must include 'Environment' and 'Owner' keys."
  }
}
