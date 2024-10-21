# IaC Docker Swarm

This repository contains Infrastructure as Code (IaC) configuration for setting up a Docker Swarm cluster on AWS using Terraform and Ansible. The setup consists of three EC2 instances: one manager and two worker nodes.

## Repository Structure

iac-Docker-swarm/<br>
├── ansible<br>
│   └── inventory<br>
│       ├── ansible.cfg<br>
│       ├── inventory<br>
│       └── playbook.yaml<br>
└── terraform<br>
    ├── bash.sh<br>
    ├── docker-swarm.pem<br>
    ├── main.tf<br>
    ├── output.tf<br>
    ├── security_group.tf<br>
    ├── terraform.tfstate<br>
    ├── terraform.tfstate.backup<br>
    └── variable.tf<br>

### Terraform Configuration

- **`main.tf`**: The main Terraform configuration file that defines the resources to be created, including the EC2 instances and security groups.
- **`variable.tf`**: Contains variable definitions for the Terraform configuration.
- **`security_group.tf`**: Defines the security groups required for the EC2 instances to allow necessary traffic.
- **`output.tf`**: Outputs the IP addresses of the created EC2 instances.
- **`bash.sh`**: A shell script that installs Docker on the EC2 instances.

### Ansible Configuration

- **`inventory/ansible.cfg`**: Configuration file for Ansible.
- **`inventory/inventory`**: An inventory file that stores the IP addresses of the manager and worker nodes.
- **`inventory/playbook.yaml`**: An Ansible playbook that contains tasks to be executed on the EC2 instances, such as configuring Docker Swarm.

## Getting Started

### Prerequisites

- Terraform installed on your local machine.
- AWS account with permissions to create EC2 instances.
- Ansible installed on your local machine.

### Setup Instructions

1. **Clone the repository:**
   https://github.com/MaheshAneraye/iac-Docker-swarm.git

cd iac-docker-swarm/terraform

### Update variables: 
Modify the variable.tf file to set the desired values for your AWS resources.

### Initialize Terraform:
terraform init

### Create the infrastructure:
terraform apply

### Outputs
After running terraform apply, the IP addresses of the EC2 instances will be displayed. These IPs can be used for further configuration or access.


### Configure Ansible: 
Navigate to the Ansible directory and update the inventory file with the IP addresses outputted by Terraform.

### Run the Ansible playbook: 
Execute the Ansible playbook to set up Docker Swarm:

cd ansible/inventory

ansible-playbook -i inventory playbook.yaml


## GitHub Actions Workflow

This repository includes a GitHub Actions workflow that automatically runs the Ansible playbook whenever changes are made to the `ansible/inventory/inventory` file. The workflow is defined in `.github/workflows/docker-swarm.yml`.

### Workflow Trigger

- The workflow is triggered on pushes to the `main` branch specifically when there are changes to the `ansible/inventory/inventory` file.

### Workflow Steps

1. **Checkout code**: The workflow checks out the repository code to access the necessary files.
2. **Install Ansible**: It installs Ansible on the GitHub Actions runner.
3. **Run Ansible Playbook**: Finally, it executes the Ansible playbook using the updated inventory file.

### Usage

To use this workflow:

1. Ensure that your Ansible playbook and inventory file are correctly set up.
2. Make changes to the `ansible/inventory/inventory` file as needed. (change ansible_host=IP addresses outputted by Terraform.)
3. Commit and push the changes to the `main` branch of your repository.
4. The GitHub Actions workflow will automatically run, executing the playbook with the updated inventory.

Feel free to modify any part of this template to fit your project’s specifics!
