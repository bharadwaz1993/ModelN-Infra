module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.project_name}-eks"
  cluster_version = var.eks_cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_size = var.eks_desired_size
      min_size     = var.eks_min_size
      max_size     = var.eks_max_size

      instance_types = var.eks_node_instance_types
    }
  }

  tags = {
    Project = var.project_name
  }
}
