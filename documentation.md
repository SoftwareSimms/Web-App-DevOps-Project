# Web-App DevOps Project Documentation - Comprehensive Overview

## Introduction
Welcome to the comprehensive documentation of my Web-App DevOps Project. This journey entailed managing the infrastructure for an Azure Kubernetes Service (AKS) deployment using Terraform and involved mastering version control, Docker containerisation, and AKS cluster setup. This document serves as a narrative of my process, decisions, and the detailed tasks I performed, showcasing the skills essential for a DevOps career.

## Version Control Workflow

### Initial Setup
- **Repository Forking:** I began by forking the main GitHub repository, setting the stage for independent development and experimentation.

### Feature Development
- **Issue Tracking:** Leveraging GitHub's issue tracking, I systematically addressed enhancements, like adding a 'Delivery Date' to the Azure SQL database.
- **Branch Strategy:** For each feature (e.g., `feature/add-delivery-date`), I created a dedicated branch, ensuring organized and focused development.
- **Coding and Committing:** Features like the 'Delivery Date' were carefully coded in `app.py`, reflected in `orders.html`, and committed with descriptive messages.
- **Code Review:** Pull requests facilitated peer reviews, ensuring quality and collaborative improvement before merging into the main branch.

### Integration and Reversion
- **Merging:** Successfully reviewed features were merged into the main branch, symbolizing completion and integration.
- **Feature Reversion:** For features deemed unnecessary, I created reversion branches (e.g., `revert/delivery-date-feature`) and used `git revert` to rollback changes.

### Best Practices
- **Documentation:** Each step was meticulously documented to maintain transparency and clarity.
- **Testing:** I conducted thorough local tests before pushes or pull requests to ensure functionality.

## Containerisation with Docker

### Building the Docker Environment
- **Base Image Selection:** Chose `python:3.8-slim` for its optimal balance of functionality and size.
- **Workspace Configuration:** Documented the setup of the working directory within the container.
- **File Transfer:** Included steps for transferring application files into the container.
- **Dependency Management:** Outlined the installation process for both system and Python dependencies.
- **Port Exposure:** Defined the necessary ports for application access.
- **Execution Command:** Provided commands to run the application within the container.

### Docker Command Guide
- **Image Construction:** Described the Docker image build process.
- **Container Deployment:** Detailed the steps for container initiation and running, including port mapping.
- **Image Management:** Explained image tagging for Docker Hub and subsequent pushing.

### Clean-Up Procedures
- **Container and Image Management:** Documented commands for container and image housekeeping to maintain an organized environment.

## Terraform Azure Network Infrastructure Configuration

### Configuration Overview
- **Variables Definition:** Defined key variables like resource group naming and Azure deployment region in `variables.tf`.
- **Resource Management:** In `main.tf`, I outlined resource group creation, virtual network setup, subnet allocation, and network security protocols.
- **Output Variables:** Provided essential outputs like resource IDs and names for efficient post-deployment management.

## AKS Cluster Setup with Terraform

### Configuring the Provider
- **Azure Specifics:** Utilized `azurerm` provider block to interface with Azure's infrastructure.
- **Resource and Node Pool Definition:** Detailed the AKS cluster setup including cluster name, location, resource group, DNS prefix, default node pool, and VM sizes.

### Service Principal Setup
- **Secure Authentication:** Established client ID and secret for secure interaction with Azure services.

### Main Terraform Configuration
- **Provider and Variable Setup:** Configured the Azure provider and defined key variables for secure Azure access.
- **Networking and Cluster Module Integration:** Integrated networking and cluster modules for a complete AKS setup.

### Terraform Initialization and Application
- **Terraform Commands:** Executed `terraform init` and `terraform apply` to create the AKS infrastructure.
- **State File Security:** Ensured the Terraform state file was securely managed and excluded from version control.

## Kubernetes Deployment for Flask Web Application

### Deployment Strategy
- **Manifests Utilization:** Used deployment and service manifests for the Flask application.
- **Deployment Strategy:** Adopted RollingUpdate for zero downtime and efficient resource use during updates.

### Testing and Validation
- **Port Forwarding and Internal Testing:** Conducted thorough testing through port forwarding and internal application navigation.
- **Application Distribution:** Planned for internal DNS setup and Ingress Controller implementation for broader access.

### External Access Considerations
- **Service Type and Security:** Discussed potential external access strategies including service type change and implementing strong authentication and TLS.

## CI/CD Pipeline Documentation

### Integration with Azure DevOps and Docker Hub
- **Pipeline Configuration:** Outlined the CI/CD pipeline's integration with Azure DevOps, Docker Hub, and AKS.
- **Validation Steps:** Described the validation steps including monitoring pod status, initiating port forwarding, and performing end-to-end application testing.

## AKS Cluster Monitoring

### Monitoring Tools and Strategies
- **Metrics Explorer Charts:** Set up and monitored key metrics like CPU usage, memory working set, disk usage, and network IO.
- **Log Analytics Insights:** Provided sample logs for node resource usage, pod phase, and container warnings.

## Azure Key Vault Implementation

### Setting Up Azure Key Vault
- **Objective:** To enhance the security of the application by storing sensitive information like database credentials securely.
- **Implementation:** I created an Azure Key Vault to securely manage these sensitive details, replacing hardcoded values in the application.

### Assigning Key Vault Administrator Role
- **Purpose:** To manage the Key Vault and its secrets effectively.
- **Action:** Assigned the Key Vault Administrator role to my Microsoft Entra ID user, granting the necessary permissions for managing the secrets.

### Creating Secrets in the Key Vault
- **Goal:** To securely store critical credentials such as server name, username, password, and database name, replacing hardcoded credentials in the application code.
- **Process:** I created four secrets in the Key Vault corresponding to these critical credentials.

### Enabling Managed Identity for AKS
- **Rationale:** To allow secure and authenticated interactions between the AKS cluster and Azure Key Vault.
- **Method:** Enabled a managed identity for the AKS cluster, facilitating a secure method of accessing the Key Vault without exposing sensitive credentials.

### Assigning Key Vault Secrets Officer Role
- **Objective:** To permit the AKS cluster to retrieve and manage the secrets stored in the Key Vault.
- **Execution:** Assigned the Key Vault Secrets Officer role to the AKS managed identity, providing it with the necessary access rights.

### Application Code Integration
- **Purpose:** To enable the application to utilize the secrets stored in Azure Key Vault for database connectivity.
- **Implementation:** Integrated Azure Identity and Azure Key Vault libraries into the Python application code. Updated the Docker image requirements to include these new libraries, ensuring the application had all necessary dependencies for interacting with the Key Vault.

### Local Testing with Azure Key Vault
- **Testing Goal:** To confirm the application's successful integration with Azure Key Vault and its ability to retrieve database connection details securely.
- **Testing Process:** Conducted thorough testing of the application locally, ensuring that it could securely access and use the credentials stored in the Key Vault.

### Deployment to AKS with Key Vault Integration
- **Deployment Objective:** To deploy the application on the AKS cluster with Azure Key Vault integration, ensuring secure access to database credentials.
- **Deployment Method:** Utilized the Azure DevOps CI/CD pipeline for deploying the modified application to the AKS cluster. Conducted comprehensive testing in the AKS environment to validate the application's functionality and its secure interaction with the Key Vault.
