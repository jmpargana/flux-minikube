variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_user" {
  description = "GitHub user"
  type        = string
  default     = ""
}

variable "github_repo" {
  description = "GitHub repository"
  type        = string
  default     = ""
}

variable "flux_cluster_path" {
  description = "Cluster path name in flux repository"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "Cluster path name in flux repository"
  type        = string
  default     = ""
}