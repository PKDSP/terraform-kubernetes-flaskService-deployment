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
              cpu    = "${var.k8s_cpu_limit}"
              memory = "${var.k8s_memory_limit}"
            }
            requests = {
              cpu    = "${var.k8s_cpu_request}"
              memory = "${var.k8s_memory_limit}"
            }
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