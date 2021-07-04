resource "kubernetes_ingress" "k8s_create_ingress" {
  metadata {
    name = "${var.k8s_metadata_name}-ingress"
    namespace = "${var.k8s_namespace}"
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "${var.k8s_metadata_name}-service"
            service_port = "${var.k8s_service_port}"
          }
          path = "/"
        }
      }
    }
    tls {
      secret_name = "tls-secret"
    }
  }
}