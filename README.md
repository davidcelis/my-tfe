# My Terraform Enterprise Setup

This is my TFE. [There are many like it](https://github.com/beekus/my-tfe), but this one is mine. To set up a clean or recently nuked local Terraform Enterprise installation (aka `tfe:local`), I run the following steps:

1. [Create a Personal Access Token on github.com](https://github.com/settings/tokens), keeping the resulting token handy
2. [Create a Personal Access Token on gitlab.com](https://gitlab.com/profile/personal_access_tokens), keeping the resulting token handy
3. `rake tfe:local:start`
4. Visit your local Terraform Enterprise install and create an access token (`/app/settings/tokens`), keeping the resulting token handy
5. Make your own variables file: `cp terraform.tfvars.example terraform.tfvars`
6. Fill in the values with your local TFE's URL (omitting the `https://`) and the two tokens you created previously
7. `terraform init`
8. `terraform import tfe_organization.hashicorp-v2 hashicorp-v2`
9. `terraform plan`
10. If it all looks good, `terraform apply`
