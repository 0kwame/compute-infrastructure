## WhizLabs: AWS Certified Solutions Architect Associate

> :bangbang: This project was created to facilitate smooth learning. If you haven't already mastered setting up cloud infrastructure manually, it is highly recommended to do so before using this project for automation. The goal is not to cut corners but to streamline learning once you have mastered the material in the labs. One of the core values of Amalitech is integrity, so let's maintain that integrity and honesty in our work.

### Introduction

This Terraform project sets up cloud infrastructure as detailed in the Compute section of the AWS Certified Solutions Architect Associate Program, facilitated by Amalitech GmbH. The configuration in this file quickly bootstraps infrastructure for use in various video labs, enabling efficient follow-along with the labs. By automating the setup, this project eliminates the need for manual configuration as subsequent labs build on top of this infrastructure, saving time and avoiding repetitive tasks.

### Setup

#### Prerequisite

1. **Terraform Installation:** Ensure you have Terraform installed. Follow this [tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to install terraform if you don't already have it

2. **AWS Configuration:** Ensure you have successfully setup aws configuration on your workstation. You can follow along this [tutorial](https://www.youtube.com/watch?v=gswVHTrRX8I) to quickly get up to speed.

### Steps

1. **Get Your IP Address:**

   - Run `curl checkip.amazonaws.com` to get your IP address.

2. **Create Terraform Variable File"**

   - Run ` echo 'local_ip_address = ""' > main.tfvars`

3. **Update IP Address:**

   - Update your ip address in `main.tfvars` file. This ip address is needed in order to allow your ip to ssh into all instances in the future

4. **Initialize Terraform Project:**

   - Run `terraform init` to initialize your project

5. **Plan Infrastructure:**

   - Run `terraform plan` to get an output of the infrastructure that will be provisioned

6. **Apply Configuration**
   - Run `terraform apply -auto-approve` to provision infrastructure

> Once your infrastruture is successfully provisioned you can explore the labs and follow along.

6. **Destroy Infrasture**
   - run `terraform destroy -auto-approve` to destroy your infrastructure once you are done.

> :warning: Don't forget to teardown your infrastructure once you are done. You don't want to incur any unexpected costs.
