resource "kubernetes_deployment" "ks8_deployment_set" {
  metadata {
    name = "${var.k8s_metadata_name}"
    namespace = "${var.k8s_namespace}"
    labels = {
      app = "${var.k8s_label_app_name}"
      release = "${var.k8s_label_release_name}"
    }
  }

  spec {
    replicas = "${var.k8s_replica_set}"

    selector {
      match_labels = {
        app = "${var.k8s_label_app_name}"
      }
    }

    strategy{
        type = "${var.k8s_strategy_name}"
    }

    template {
      metadata {
        labels = {
          app = "${var.k8s_label_app_name}"
        }
      }

      spec {
        container {
          image = "${var.k8s_image_name}"
          name  = "${var.k8s_metadata_name}"
          image_pull_policy = "IfNotPresent"
          port {
            protocol = "TCP"
            container_port = "${var.k8s_container_port}"
            name = "${var.k8s_port_name}"

          }
          volume_mount{
            name = "vol-${var.k8s_metadata_name}"
            mount_path = "/tmp/logs"

          }
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          liveness_probe {
            http_get {
              path = "/login"
              port = 8080

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
        volume{
          name = "vol-${var.k8s_metadata_name}"
          empty_dir {}
        }
      }
    }
  }
}