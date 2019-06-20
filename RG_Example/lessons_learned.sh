Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\Marlon\Downloads\terraform> terraform init

Initializing provider plugins...
- Checking for available provider plugins...

No provider "azurerm" plugins meet the constraint "1.24,~> 1.27".

The version constraint is derived from the "version" argument within the
provider "azurerm" block in configuration. Child modules may also apply
provider version constraints. To view the provider versions requested by each
module in the current configuration, run "terraform providers".

To proceed, the version constraints for this provider must be relaxed by
either adjusting or removing the "version" argument in the provider blocks
throughout the configuration.


Warning: Skipping backend initialization pending configuration upgrade

The root module configuration contains errors that may be fixed by running the
configuration upgrade tool, so Terraform is skipping backend initialization.
See below for more information.


Error: no suitable version is available

# Note: If you provider version is wrong, remove it and let Terraform downloaded it for you.
# Then you can add the specific provider version to your deployment.

PS C:\Users\Marlon\Downloads\terraform> terraform init

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "azurerm" (terraform-providers/azurerm) 1.30.1...


Warning: Skipping backend initialization pending configuration upgrade

The root module configuration contains errors that may be fixed by running the
configuration upgrade tool, so Terraform is skipping backend initialization.
See below for more information.


Terraform has initialized, but configuration upgrades may be needed.

Terraform found syntax errors in the configuration that prevented full
initialization. If you've recently upgraded to Terraform v0.12, this may be
because your configuration uses syntax constructs that are no longer valid,
and so must be updated before full initialization is possible.

Terraform has installed the required providers to support the configuration
upgrade process. To begin upgrading your configuration, run the following:
    terraform 0.12upgrade

To see the full set of errors that led to this message, run:
    terraform validate
    
# Use terraform validate to locate the issue with your deployment.
# This is highly recommended for ARM Templates as well.

PS C:\Users\Marlon\Downloads\terraform> terraform validate

Error: Duplicate provider configuration

  on main1.tf line 1:
   1: provider "azurerm" {

A default (non-aliased) provider configuration for "azurerm" was already given
at main.tf:1,1-19. If multiple configurations are required, set the "alias"
argument for alternative configurations.

Error: Duplicate resource "azurerm_resource_group" configuration

  on main1.tf line 9:
   9: resource "azurerm_resource_group" "TFrg" {

A azurerm_resource_group resource named "TFrg" was already declared at
main.tf:9,1-41. Resource names must be unique per type in each module.

# I removed the file mentioned above as it was not needed.

PS C:\Users\Marlon\Downloads\terraform> terraform validate
Success! The configuration is valid.

PS C:\Users\Marlon\Downloads\terraform> terraform init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.azurerm: version = "~> 1.30"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Note: I added the version as suggested to my main.tf file

PS C:\Users\Marlon\Downloads\terraform> terraform validate
Success! The configuration is valid.

PS C:\Users\Marlon\Downloads\terraform> terraform init

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\Marlon\Downloads\terraform> terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.TFrg will be created
  + resource "azurerm_resource_group" "TFrg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "myTFrg"
      + tags     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

PS C:\Users\Marlon\Downloads\terraform> terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.TFrg will be created
  + resource "azurerm_resource_group" "TFrg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "myTFrg"
      + tags     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

# Note: I've mutated all references of a subscription and the like.

azurerm_resource_group.TFrg: Creating...
azurerm_resource_group.TFrg: Creation complete after 2s [id=/subscriptions/3r4e5672-3r5t-4d90-a801-8c1888888432/resourceGroups/myTFrg]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
