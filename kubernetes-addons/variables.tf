variable "eks_cluster_id" {
  description = "EKS Cluster Id"
}

variable "eks_worker_security_group_id" {
  description = "EKS Worker Security group Id created by EKS module"
  default     = ""
}

variable "eks_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  default     = ""
}

variable "eks_oidc_provider_arn" {
  description = "The ARN of the OIDC Provider if `enable_irsa = true`."
  default     = ""
}

variable "auto_scaling_group_names" {
  description = "List of self-managed node groups autoscaling group names"
  default     = []
}

variable "node_groups_iam_role_arn" {
  type    = list(string)
  default = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

#-----------EKS MANAGED ADD-ONS------------
variable "amazon_eks_vpc_cni_config" {
  description = "ConfigMap of Amazon EKS VPC CNI add-on"
  type        = any
  default     = {}
}

variable "amazon_eks_coredns_config" {
  description = "ConfigMap for Amazon CoreDNS EKS add-on"
  type        = any
  default     = {}
}

variable "amazon_eks_kube_proxy_config" {
  description = "ConfigMap for Amazon EKS Kube-Proxy add-on"
  type        = any
  default     = {}
}

variable "amazon_eks_aws_ebs_csi_driver_config" {
  description = "configMap for AWS EBS CSI Driver add-on"
  type        = any
  default     = {}
}

variable "enable_amazon_eks_vpc_cni" {
  type        = bool
  default     = false
  description = "Enable VPC CNI add-on"
}

variable "enable_amazon_eks_coredns" {
  type        = bool
  default     = false
  description = "Enable CoreDNS add-on"
}

variable "enable_amazon_eks_kube_proxy" {
  type        = bool
  default     = false
  description = "Enable Kube Proxy add-on"
}

variable "enable_amazon_eks_aws_ebs_csi_driver" {
  type        = bool
  default     = false
  description = "Enable EKS Managed AWS EBS CSI Driver add-on"
}

#-----------CLUSTER AUTOSCALER-------------
variable "enable_cluster_autoscaler" {
  type        = bool
  default     = false
  description = "Enable Cluster autoscaler add-on"
}

variable "cluster_autoscaler_helm_config" {
  type        = any
  default     = {}
  description = "Cluster Autoscaler Helm Chart config"
}

#-----------Amazon Managed Service for Prometheus-------------
variable "enable_aws_managed_prometheus" {
  type        = bool
  default     = false
  description = "Enable AWS Managed Prometheus Service"
}

variable "aws_managed_prometheus_workspace_id" {
  type        = string
  default     = ""
  description = "AWS Managed Prometheus WorkSpace Name"
}

variable "aws_managed_prometheus_ingest_iam_role_arn" {
  type        = string
  default     = ""
  description = "AWS Managed Prometheus WorkSpaceSpace IAM role ARN"
}

variable "aws_managed_prometheus_ingest_service_account" {
  type        = string
  default     = ""
  description = "AWS Managed Prometheus Ingest Service Account"
}

#-----------PROMETHEUS-------------
variable "enable_prometheus" {
  description = "Enable Community Prometheus add-on"
  type        = bool
  default     = false
}

variable "prometheus_helm_config" {
  description = "Community Prometheus Helm Chart config"
  type        = any
  default     = {}
}

#-----------METRIC SERVER-------------
variable "enable_metrics_server" {
  type        = bool
  default     = false
  description = "Enable metrics server add-on"
}

variable "metrics_server_helm_config" {
  type        = any
  default     = {}
  description = "Metrics Server Helm Chart config"
}

#-----------TRAEFIK-------------
variable "enable_traefik" {
  type        = bool
  default     = false
  description = "Enable Traefik add-on"
}

variable "traefik_helm_config" {
  type        = any
  default     = {}
  description = "Traefik Helm Chart config"
}

#-----------AGONES-------------
variable "enable_agones" {
  type        = bool
  default     = false
  description = "Enable Agones GamServer add-on"
}

variable "agones_helm_config" {
  type        = any
  default     = {}
  description = "Agones GameServer Helm Chart config"
}

#-----------AWS LB Ingress Controller-------------
variable "enable_aws_load_balancer_controller" {
  type        = bool
  default     = false
  description = "Enable AWS Load Balancer Controller add-on"
}

variable "aws_load_balancer_controller_helm_config" {
  type        = any
  description = "AWS Load Balancer Controller Helm Chart config"
  default     = {}
}

#-----------NGINX-------------
variable "enable_ingress_nginx" {
  type        = bool
  default     = false
  description = "Enable Ingress Nginx add-on"
}

variable "ingress_nginx_helm_config" {
  description = "Ingress Nginx Helm Chart config"
  type        = any
  default     = {}
}

#-----------SPARK K8S OPERATOR-------------
variable "enable_spark_k8s_operator" {
  type        = bool
  default     = false
  description = "Enable Spark on K8s Operator add-on"
}

variable "spark_k8s_operator_helm_config" {
  description = "Spark on K8s Operator Helm Chart config"
  type        = any
  default     = {}
}

#-----------AWS FOR FLUENT BIT-------------
variable "enable_aws_for_fluentbit" {
  type        = bool
  default     = false
  description = "Enable AWS for FluentBit add-on"
}

variable "aws_for_fluentbit_helm_config" {
  type        = any
  description = "AWS for FluentBit Helm Chart config"
  default     = {}
}

#-----------FARGATE FLUENT BIT-------------
variable "enable_fargate_fluentbit" {
  type        = bool
  default     = false
  description = "Enable Fargate FluentBit add-on"
}

variable "fargate_fluentbit_addon_config" {
  type        = any
  description = "Fargate fluentbit add-on config"
  default     = {}
}

#-----------CERT MANAGER-------------
variable "enable_cert_manager" {
  type        = bool
  default     = false
  description = "Enable Cert Manager add-on"
}

variable "cert_manager_helm_config" {
  type        = any
  description = "Cert Manager Helm Chart config"
  default     = {}
}
#-----------AWS OPEN TELEMETRY ADDON-------------
variable "enable_aws_open_telemetry" {
  type        = bool
  default     = false
  description = "Enable AWS Open Telemetry Distro add-on"
}

variable "aws_open_telemetry_addon_config" {
  type        = any
  default     = {}
  description = "AWS Open Telemetry Distro add-on config"
}

#-----------ARGOCD ADDON-------------
variable "enable_argocd" {
  type        = bool
  default     = false
  description = "Enable Argo CD Kubernetes add-on"
}

variable "argocd_helm_config" {
  type        = any
  default     = {}
  description = "Argo CD Kubernetes add-on config"
}

variable "argocd_applications" {
  type        = any
  default     = {}
  description = "Argo CD Applications config to bootstrap the cluster"
}

variable "argocd_manage_add_ons" {
  type        = bool
  default     = false
  description = "Enable managing add-on configuration via ArgoCD"
}

#-----------AWS NODE TERMINATION HANDLER-------------
variable "enable_aws_node_termination_handler" {
  type        = bool
  default     = false
  description = "Enable AWS Node Termination Handler add-on"
}

variable "aws_node_termination_handler_helm_config" {
  type        = any
  description = "AWS Node Termination Handler Helm Chart config"
  default     = {}
}

#-----------KEDA ADDON-------------
variable "enable_keda" {
  type        = bool
  default     = false
  description = "Enable KEDA Event-based autoscaler add-on"
}

variable "keda_helm_config" {
  type        = any
  default     = {}
  description = "KEDA Event-based autoscaler add-on config"
}

variable "keda_create_irsa" {
  type        = bool
  description = "Indicates if the add-on should create a IAM role + service account"
  default     = true
}

variable "keda_irsa_policies" {
  type        = list(string)
  description = "Additional IAM policies for a IAM role for service accounts"
  default     = []
}

#-----------Vertical Pod Autoscaler(VPA) ADDON-------------
variable "enable_vpa" {
  type        = bool
  default     = false
  description = "Enable Kubernetes Vertical Pod Autoscaler add-on"
}

variable "vpa_helm_config" {
  type        = any
  default     = {}
  description = "Vertical Pod Autoscaler Helm Chart config"
}

#-----------Apache YuniKorn ADDON-------------
variable "enable_yunikorn" {
  type        = bool
  default     = false
  description = "Enable Apache YuniKorn K8s scheduler add-on"
}

variable "yunikorn_helm_config" {
  type        = any
  default     = {}
  description = "YuniKorn K8s scheduler Helm Chart config"
}
