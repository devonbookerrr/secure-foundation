module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  aws_region          = var.aws_region
  project_name        = var.project_name
  environment         = var.environment
  tags                = var.tags
}
