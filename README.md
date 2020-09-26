# Terraform
This project is a collection of terraform files used for tests purposes


### Tech

Terraform description:

#### Provider AWS
* [aws\apache] - Deploy a Ubuntu VM and install Apache WebServer

#### Provider Azure
* [azure\apache] - Deploy a Ubuntu VM and install Apache WebServer

### Installation

Install Terraform:

* Ubuntu/Debian 
```sh
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
$ sudo apt-get update && sudo apt-get install terraform
```

* Centos 7
```sh
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
$ sudo yum -y install terraform
```

HashiCorp - Install Terraform documentation
https://learn.hashicorp.com/tutorials/terraform/install-cli

### Configuring Terraform

* AWS

Creating a AWS Access Key

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-creds

```sh
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
```

* Azure

Creating a service Principal:

https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html

```sh
$ export ARM_CLIENT_ID="99999999-9999-9999-9999-999999999999"
$ export ARM_CLIENT_SECRET="99999999.9999.99999999999.9.99999999"
$ export ARM_SUBSCRIPTION_ID="99999999-9999-9999-9999-999999999999"
$ export ARM_TENANT_ID="99999999-9999-9999-9999-9999999999999"
```

### Execute Terraform

Deploy:

```sh
$ terraform init
$ terraform plan
$ terraform apply
```
