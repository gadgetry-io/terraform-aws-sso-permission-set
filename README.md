# terraform-aws-sso-permission-set

[Gadgetry's](https://gadgetry.io) Terraform AWS SSO Permission Set Module

## Usage

### AWS Administrator

    module "AWSAdministrator" {
      source = ".github.com/gadgetry-io/aws/sso-permission-set"
      version = "1.0.0"

      name        = "AWSAdministrator"
      description = "AWSAdministrator provides administrator access within an account, but no ability to manage users, roles, or orgs"

      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
      ]
    }

### AWS Org Administrator

    module "AWSOrgAdministrator" {
      source = ".github.com/gadgetry-io/aws/sso-permission-set"
      version = "1.0.0"

      name        = "AWSOrgAdministrator"
      description = "AWSOrgAdministrator provides full administrator access with ability to manage orgs, users and grant access to accounts"

      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
        "arn:aws:iam::aws:policy/AWSOrganizationsFullAccess",
        "arn:aws:iam::aws:policy/AWSSSOMasterAccountAdministrator",
        "arn:aws:iam::aws:policy/AWSServiceCatalogAdminFullAccess"
      ]
    }

### AWS Developer

    module "AWSDeveloper" {
      source = ".github.com/gadgetry-io/aws/sso-permission-set"
      version = "1.0.0"

      name        = "AWSDeveloper"
      description = "AWSDeveloper provides PowerUser access to AWS services and resources, but does no allow management of users and groups."

      managed_policy_arns = [
        "arn:aws:iam::aws:policy/PowerUserAccess",
      ]
    }

### AWS Support

    module "AWSSupport" {
      source = ".github.com/gadgetry-io/aws/sso-permission-set"
      version = "1.0.0"

      name        = "AWSSupport"
      description = "AWSSupport grants permissions to troubleshoot and resolve issues in an AWS account. Also enables permissions to contact AWS support to create and manage cases in addition to read-only access to AWS services and resources."

      managed_policy_arns = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess",
        "arn:aws:iam::aws:policy/job-function/SupportUser",
      ]
    }

### AWS Auditor

    module "AWSAuditor" {
      source = ".github.com/gadgetry-io/aws/sso-permission-set"
      version = "1.0.0"

      name        = "AWSAuditor"
      description = "AWSAuditor provides read-only access to AWS services and resources. "

      managed_policy_arns = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess",
      ]
    }
