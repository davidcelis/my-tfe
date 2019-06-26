provider "tfe" {
  hostname = var.hostname
  token    = var.tfe_token

  version  = "~> 0.10"
}

// The default organization
resource "tfe_organization" "hashicorp_v2" {
  name  = "hashicorp_v2"
  email = "admin@${var.hostname}"
}

// OAuth clients using Personal Access Tokens
resource "tfe_oauth_client" "github" {
  organization     = tfe_organization.hashicorp_v2.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_oauth_client" "gitlab" {
  organization     = tfe_organization.hashicorp_v2.name
  api_url          = "https://gitlab.com/api/v4"
  http_url         = "https://gitlab.com"
  oauth_token      = var.gitlab_oauth_token
  service_provider = "gitlab_hosted"
}


// The ever-present `terraform-random` workspaces
resource "tfe_workspace" "github-random" {
  organization   = tfe_organization.hashicorp_v2.name
  name           = "github-random"
  auto_apply     = false
  queue_all_runs = true

  vcs_repo {
    identifier     = "davidcelis/terraform-random"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace" "gitlab-random" {
  organization   = tfe_organization.hashicorp_v2.name
  name           = "gitlab-random"
  auto_apply     = false
  queue_all_runs = true

  vcs_repo {
    identifier     = "davidcelis/terraform-random"
    oauth_token_id = tfe_oauth_client.gitlab.oauth_token_id
  }
}