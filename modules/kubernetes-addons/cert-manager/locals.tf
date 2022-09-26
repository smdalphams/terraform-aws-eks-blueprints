locals {
  name                 = "cert-manager"
  service_account_name = "cert-manager" # AWS PrivateCA is expecting the service account name as `cert-manager`

  default_helm_config = {
    name        = local.name
    chart       = local.name
    repository  = "https://charts.jetstack.io"
    version     = "v1.9.1"
    namespace   = local.name
    description = "Cert Manager Add-on"
    values      = local.default_helm_values
  }

  default_helm_values = [templatefile("${path.module}/values.yaml", {})]

  helm_config = merge(
    local.default_helm_config,
    var.helm_config
  )

  set_values = concat(
    [
      {
        name  = "serviceAccount.name"
        value = local.service_account_name
      },
      {
        name  = "serviceAccount.create"
        value = false
      }
    ],
    try(var.helm_config.set_values, [])
  )

  irsa_config = {
    kubernetes_namespace              = local.helm_config["namespace"]
    kubernetes_service_account        = local.service_account_name
    create_kubernetes_namespace       = try(local.helm_config["create_namespace"], true)
    create_kubernetes_service_account = true
    kubernetes_svc_image_pull_secrets = var.kubernetes_svc_image_pull_secrets
    irsa_iam_role_name                = try(var.helm_config.irsa_iam_role_name, "")
    irsa_iam_policies                 = concat([aws_iam_policy.cert_manager.arn], var.irsa_policies)
  }

  argocd_gitops_config = {
    enable             = true
    serviceAccountName = local.service_account_name
  }
}
