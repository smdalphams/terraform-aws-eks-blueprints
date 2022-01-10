data "aws_region" "current" {}

data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_id
}

data "aws_iam_policy_document" "karpenter" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ec2:CreateLaunchTemplate",
      "ec2:CreateFleet",
      "ec2:RunInstances",
      "ec2:CreateTags",
      "iam:PassRole",
      "ec2:TerminateInstances",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeAvailabilityZones",
      "ssm:GetParameter"
    ]
  }
}