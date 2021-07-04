variable "k8s_metadata_name" {
  type        = string
  description = "Name of the application"
}
variable "k8s_namespace" {
  type        = string
  description = "Name of the namespace or create the a new namespaces"
}
variable "k8s_label_app_name" {
  type        = string
  description = "App name"
}
variable "k8s_label_release_name" {
  type        = string
  description = "Release Name"
}
variable "k8s_replica_set" {
  type        = number
  description = "Add number of Replica set"
}
variable "k8s_image_name" {
  type        = string
  description = "Image name"
}
variable "k8s_strategy_name" {
  type        = string
  default = "RollingUpdate"
  description = "Type of strategy for deployment"
}
variable "k8s_host_port" {
  type        = number
  description = "Host port"
}
variable "k8s_port_name" {
  type        = string
  default = "http"
  description = "Port name"
}
variable "k8s_container_port" {
  type        = number
  description = "Container port"
}
variable "k8s_service_port" {
  type        = number
  description = "Service port"
}
variable "k8s_cpu_limit" {
  type        = string
  default = "0.5"
  description = "Min cpu's unit"
}
variable "k8s_cpu_request" {
  type        = string
  default = "256m"
  description = "Max cpu's unit"
}
variable "k8s_memory_request" {
  type        = string
  default = "256Mi"
  description = "Memory min"
}
variable "k8s_memory_limit" {
  type        = string
  default = "512Mi"
  description = "Max memory to be used"
}
variable "k8s_service_type" {
  type        = string
  description = "Service type like NodePort, ClusterIP etc"
}
