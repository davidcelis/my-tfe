# My Terraform Enterprise Setup

This is my TFE. [There are many like it](https://github.com/beekus/my-tfe), but this one is mine. To set up a clean or recently nuked local Terraform Enterprise installation (aka `tfe:local`), I run the following steps:

1. [Create a Personal Access Token on github.com](https://github.com/settings/tokens), keeping the resulting token handy
2. [Create a Personal Access Token on gitlab.com](https://gitlab.com/profile/personal_access_tokens), keeping the resulting token handy
3. `rake tfe:local:start`
4. Visit your local Terraform Enterprise install and create an access token (`/app/settings/tokens`), keeping the resulting token handy
5. Make your own variables file: `cp terraform.tfvars.example terraform.tfvars`
6. Fill in the values with your local TFE's URL (omitting the `https://`) and the two tokens you created previously
7. `terraform init`
8. `terraform plan`
9. If it all looks good, `terraform apply`

_Note: I'm creating a brand new organization to test things in as opposed to using the seeded hashicorp-v2 organization. If you copy this repo and just want to use hashicorp-v2, make sure to update the organization details in `main.tf`. By default, I create an org named `celis-brewery` which is, admittedly, pretty specific to myself._
