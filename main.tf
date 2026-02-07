# Sandbox-safe Deployment using nginx-unprivileged image
# Runs as non-root to avoid CrashLoopBackOff issues in OpenShift Sandbox
# ---------------------------------
# Deployment
# ---------------------------------
resource "kubernetes_deployment" "app" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels    = { app = var.app_name }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = { app = var.app_name }
    }

    template {
      metadata {
        labels = { app = var.app_name }
      }

      spec {
        container {
          name  = var.app_name
          image = "nginxinc/nginx-unprivileged"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

# Service exposes Pod port 8080 via port 80
# Port-forward is required to access in Sandbox due to Route restrictions
# ---------------------------------
# Service
# ---------------------------------
resource "kubernetes_service" "app" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  spec {
    selector = { app = var.app_name }

    port {
      name        = "http"
      port        = 80      # external Service port
      target_port = 8080      # Pod listens here
    }
  }
}
