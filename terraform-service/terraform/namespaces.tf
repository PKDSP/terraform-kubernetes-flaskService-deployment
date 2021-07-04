resource "kubernetes_namespace" "create_namespace" {
  metadata {
    name = var.k8s_namespace
  }
}
