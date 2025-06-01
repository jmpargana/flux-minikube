
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.2"
    }
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.5.2"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.1"
    }
  }
}


provider "minikube" {
  kubernetes_version = "v1.30.0"
}

provider "flux" {
  kubernetes = {
    host = minikube_cluster.docker.host

    client_certificate     = minikube_cluster.docker.client_certificate
    client_key             = minikube_cluster.docker.client_key
    cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
  }

  git = {
    url = var.github_repo_url
    ssh = {
        username = "git"
        private_key = tls_private_key.flux.private_key_pem
    }
  }
}

provider "github" {
  owner = var.github_user
  token = var.github_token
}