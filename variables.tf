variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
  validation {
    condition     = can(cidrnetmask(var.public_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
  validation {
    condition     = can(cidrnetmask(var.private_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "project_name" {
  description = "Project name used for tagging and naming"
  type        = string
  default     = "secure-foundation"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]+$", var.project_name))
    error_message = "project_name must be lowercase alphanumeric and hyphens, starting with a letter."
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "tags" {
  description = "Tags to apply to all resources. Must include 'Environment' and 'Owner'."
  type        = map(string)
  validation {
    condition     = contains(keys(var.tags), "Environment") && contains(keys(var.tags), "Owner")
    error_message = "tags must include 'Environment' and 'Owner' keys."
  }
}
