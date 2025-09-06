Terraform Azure Infrastructure Deployment
📌 Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision a complete Azure infrastructure.
The setup includes:

Resource Group

Virtual Network & Subnets

Network Security Group (NSG) with rules

Public IP

Network Interfaces (NICs)

Two Linux Virtual Machines

Azure Load Balancer with backend pool

The configuration uses for_each loops and variables for modular and scalable deployments.

🏗️ Architecture

Resource Group: mehar_rg

VNet: meharVnet (10.0.0.0/16)

Subnets:

meharsubent1 (10.0.0.0/24)

meharsubent2 (10.0.1.0/24) (can be added later)

Public IP: mehapip1

NICs: meharnic1, meharnic2

VMs: lbvm1, lbvm2 (Standard_F2 size)

Load Balancer: TestLoadBalancer with backend pool and HTTP (port 80) load balancing

NSG: securensg with inbound HTTP (80) rule

⚙️ Prerequisites

Terraform
 v1.3+

Azure CLI

An active Azure Subscription

🚀 Deployment Steps
1. Clone this repository
git clone https://github.com/<your-username>/terraform-azure-infra-deployment.git
cd terraform-azure-infra-deployment

2. Authenticate with Azure
az login

3. Initialize Terraform
terraform init

4. Preview the resources to be created
terraform plan

5. Deploy the infrastructure
terraform apply -auto-approve

6. Destroy infrastructure (when not needed)
terraform destroy -auto-approve

🔐 Security Notes

Default credentials (Useradmin/Useradmin@1234) are for demo purposes only.

Change admin username and password before production use.

Apply role-based access control (RBAC) and stronger firewall/NSG rules as needed.