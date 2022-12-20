# Anypoint Terraform Provider Demo

## Introduction
This demo presents the base Terraform project structure to create Anypoint Platform resources.

It creates one business group and adds three environments to it. You can check [resources.tf](resources.tf) file for the details.


## How to use this demo ? 
Before you begin, make sure you install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

Copy the demo folder to your workspace and perform the following actions: 

1. Fill the [params.tfvars.json](params.tfvars.json) file with your own parameters. You will find more information about each parameter in the [Terraform parameters file](#terraform-parameters-file) section
2. Please use the following commands on your terminal:
    * If it's the first time you execute this specific instance of the demo, use the following command to initialize Anypoint Terraform provider: 
      ```shell
      $ terraform init  
      ```
    * To apply the changes and create the resources in Anypoint Platform, use the following command: 
      ```shell
      $ terraform apply -var-file="params.tfvars.json"
      ```
      Terraform will show you all the actions it will perform and ask for your validation. 
    * To destroy the resources you've previously created, use the following command:
      ```shell
      $ terraform destroy -var-file="params.tfvars.json"
      ```

## Resource creation and recycling
When the terraform script is executed, terraform compiles your specification to know exactly what it will create and in which order. 

You may have noticed that the business group [owner_id](resources.tf) field makes a reference to ```data.anypoint_bg.root_org.owner_id```. It's referencing 
a data source. Check [data.tf](data.tf) to see that we are using the root_org variable (provided in the [params.tfvars.json](params.tfvars.json) or [variables.tf](variables.tf)) to load the root organization data and use it in our resources.

When Terraform applies changes, the `tfstate` file is updated to save the latest resources state.

When Terraform is executed for an update, it will compare against its latest state to refresh and recycle all resources. 

> **N.B:** If the resource has been changed outside terraform (using Anypoint Platform UI, for example) Terraform will not include those changes, and they will be overwritten.

To learn more about those Terraform concepts, check [resources](https://developer.hashicorp.com/terraform/language/resources/syntax) and [data sources](https://developer.hashicorp.com/terraform/language/data-sources) documentation. 


## Terraform parameters file
Terraform uses the parameters file to contextualize its execution. Following is the list of parameters required for this demo
```json
{
  "username": "xxxxxxxx",                             // anypoint username 
  "password": "xxxxxxxx",                             // anypoint password
  "root_org": "xxxxxxxxx-xxxx-xxxx-xxx-xxxxxxxxxx",   // root business group id
  "cplane": "us"                                      // anypoint control plane
}
```
The anypoint user should have admin privileges.  


## Disclaimer
**This is an [UNLICENSED software, please review the considerations](LICENSE).** 
This is an open-source project; it does not form part of the official MuleSoft product stack and is therefore not included in MuleSoft support SLAs. Issues should be directed to the community, who will try to assist on a best endeavors basis. This application is distributed **as is**.
