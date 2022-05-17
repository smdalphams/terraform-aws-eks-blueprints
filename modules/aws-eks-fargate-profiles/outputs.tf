output "eks_fargate_profile_role_name" {
  description = "Name of the EKS Fargate Profile IAM role"
  value       = try(aws_iam_role.fargate[0].name, null)
}

output "eks_fargate_profile_id" {
  description = "EKS Cluster name and EKS Fargate Profile name separated by a colon"
  value       = aws_eks_fargate_profile.eks_fargate.id
}
