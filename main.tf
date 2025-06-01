
data "github_repository" "this" {
  name        = var.github_repo
}

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "this" {
  title      = "flux-ssh-key"
  repository = data.github_repository.this.name
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}

resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = var.cluster_name
}

resource "flux_bootstrap_git" "this" {
  depends_on = [github_repository_deploy_key.this]

  embedded_manifests = true
  path               = var.flux_cluster_path
}