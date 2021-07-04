resource "kubernetes_service" "k8s_service_set" {
  metadata {
    name = "${var.k8s_metadata_name}-service"
    namespace = "${var.k8s_namespace}"
  }
  spec {
    selector = {
      app = "${var.k8s_label_app_name}"
    }
    session_affinity = "None"
    port {
      port        = "${var.k8s_service_port}"
      target_port = "${var.k8s_container_port}"
      protocol= "TCP"
    }
    type = "${var.k8s_service_type}"
  }
}
