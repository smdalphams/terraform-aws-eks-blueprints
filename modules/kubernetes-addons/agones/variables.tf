variable "helm_config" {
  type        = any
  default     = {}
  description = "Helm provider config for Agones GameServer"
}

variable "eks_worker_security_group_id" {
  type        = string
  description = "EKS Worker Security Group ID"
}

variable "manage_via_gitops" {
  type        = bool
  default     = false
  description = "Determines if the add-on should be managed via GitOps."
}

variable "addon_context" {
  type = object({
    aws_caller_identity_account_id = string
    aws_caller_identity_arn        = string
    aws_eks_cluster_endpoint       = string
    aws_partition_id               = string
    aws_region_name                = string
    eks_cluster_id                 = string
    eks_oidc_issuer_url            = string
    eks_oidc_provider_arn          = string
    tags                           = map(string)
  })
  description = "Input configuration for the addon"
}