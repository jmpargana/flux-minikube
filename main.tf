resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = var.cluster_name
}


resource "flux_bootstrap_git" "this" {
  embedded_manifests = true
  path               = var.flux_cluster_path
}
