# Web-App DevOps Project Documentation

Welcome to my repository where I manage the infrastructure for an Azure Kubernetes Service (AKS) deployment using Terraform. The documentation here details the version control workflow, containerisation practices with Docker, and the Terraform configurations for setting up network infrastructure and the AKS cluster.

## Version Control Workflow

### Setting the Stage
- **Repository Forking**: I forked the main repository on GitHub for my independent development work.

### Developing New Features
- **Issue Tracking**: I initiated new issues to track enhancements such as adding a 'Delivery Date' field to our Azure SQL database.
- **Branch Strategy**: For each feature, like `feature/add-delivery-date`, I created a separate branch from the main.
- **Coding and Committing**: I implemented the 'Delivery Date' feature in `app.py`, updated `orders.html` for its display, and committed the changes with detailed messages.
- **Code Review**: I submitted pull requests for peer review before merging any code into the main branch.

### Integrating Features
- **Merging**: I merged approved features into the main branch after thorough reviews.

### Feature Reversion
- **Reversion Decision**: When a feature was deemed unnecessary, I made the decision to revert.
- **Reversion Process**: I created a branch `revert/delivery-date-feature` and performed a `git revert` with a clear explanation in the commit message.
- **Reversion Finalisation**: I merged the revert changes back into the main branch post-review.

### Best Practices
- **Documentation**: I meticulously documented each step to maintain clarity.
- **Testing**: Prior to pushing or creating pull requests, I conducted local tests to ensure seamless functionality.

## Containerisation with Docker

### Objective
- I containerised the application to guarantee consistency across environments and simplify deployment procedures.

### Crafting the Dockerfile
- **Base Image Selection**: I chose a base image such as `python:3.8-slim` for its balance between functionality and size.
- **Workspace Configuration**: I documented how to establish the working directory within the container.
- **Application File Transfer**: I included instructions for transferring application files into the container.
- **Dependency Management**: I detailed the process for installing both system and Python dependencies.
- **Port Exposure**: I specified which ports need to be exposed for the application.
- **Application Execution**: I provided the command to run the application inside the container.

### Docker Command Guide
- **Image Construction**: I described the process to build the Docker image from the Dockerfile.
- **Container Deployment**: I detailed how to initiate and run the container, including port mapping.
- **Image Tagging and Pushing**: I explained the method for tagging images for Docker Hub and pushing them.

### Clean-Up Procedures
- **Container Housekeeping**: Commands for listing and removing containers.
- **Image Management**: Instructions for listing and deleting images to conserve disk space.

## Terraform Azure Network Infrastructure Configuration

### Overview
- I've provided a detailed step-by-step guide to set up the AKS infrastructure using Terraform.

### Variables (`variables.tf`)
- **Resource Group Naming**: I've outlined the Azure Resource Group details.
- **Deployment Region Specification**: The Azure region for resource deployment is specified.
- **Virtual Network Addressing**: I've defined the VNet address space.

### Resource Definitions (`main.tf`)
- **Resource Grouping**: I've organised resources under a single resource group.
- **Virtual Network Creation**: An isolated network for AKS is established.
- **Subnet Allocation**: I've allocated network segments within the VNet for AKS components.
- **Network Security Protocols**: Security rules are managed through the Network Security Group.

### Output Variables (`outputs.tf`)
- I've provided outputs for resource IDs and names post-deployment, including the Virtual Network ID and subnet IDs. These outputs are crucial for referencing and managing the deployed resources efficiently.

## Terraform Configuration for Azure Kubernetes Service (AKS) Cluster

### Provider Block
- **azurerm**: This block specifies that Azure is the chosen cloud provider for this Terraform configuration. The use of a specific provider like `azurerm` is crucial because it dictates how Terraform interacts with the respective cloud infrastructure, ensuring that resources are managed in a manner consistent with Azure's architecture and services.

### Resource: azurerm_kubernetes_cluster
- **name**: The AKS cluster's name is defined here, sourced from a variable. This practice of using variables for resource names enhances flexibility and reusability of the Terraform code.
- **location**: This parameter sets the geographical location for the AKS cluster, aligning resource deployment with regional preferences and compliance requirements.
- **resource_group_name**: Specifies the Azure resource group under which the AKS cluster will be managed. Organising resources into groups is vital for efficient resource management and cost tracking.
- **dns_prefix**: The DNS prefix for the AKS cluster contributes to forming the Fully Qualified Domain Name (FQDN) for the Kubernetes API server, a crucial element for network communication and service discovery.

### Default Node Pool
- **name**: The name for the default node pool is specified, which is key to identifying and managing the node pool within the AKS cluster.
- **node_count**: Defines the number of nodes (Virtual Machines) in the node pool, a critical factor for scaling and resource allocation.
- **vm_size**: The size of the Virtual Machines in the node pool is set, impacting the cluster's performance and resource availability.

### Service Principal
- **client_id** and **client_secret**: These credentials are for the service principal used by AKS to interact with other Azure services. The use of a service principal is fundamental for secure and scoped access to Azure resources.

### Outputs for Azure Kubernetes Service (AKS) Cluster Module

#### Introduction
- The `outputs.tf` file in the AKS cluster module defines important output variables. These variables are essential for capturing and making use of key information about the provisioned AKS cluster.

#### Output Variables
- **`aks_cluster_name` and `aks_cluster_id`**: These provide the name and unique identifier of the AKS cluster, essential for referencing and managing the cluster within Azure.
- **`aks_kubeconfig`**: This output captures the Kubernetes configuration file, pivotal for interacting with and managing the AKS cluster using tools like `kubectl`.

## Main Terraform Configuration for Azure Kubernetes Service (AKS)

### Overview
- The main Terraform configuration (`main.tf`) in the `aks-terraform` project directory is a central piece, defining the Azure provider and input variables for secure authentication.

### Azure Provider Setup
- **Provider Block**:
  - The `azurerm` provider block is configured with service principal credentials, enabling Terraform to authenticate and manage resources within Azure securely.

### Defining Input Variables (`variables.tf`)
- **client_id, client_secret, subscription_id, and tenant_id**: These variables are defined for the Azure Service Principal, ensuring secure and specific access to Azure resources.

### Secure Credential Management
- It's advised to store `client_id` and `client_secret` as environment variables. This approach safeguards credentials by keeping them out of the Terraform configuration files.

### Networking Module Integration in Main Terraform Configuration

#### Adding the Networking Module in `main.tf`
- **Module "networking"**:
  - The path to the networking module is specified, and input variables like `resource_group_name`, `location`, and `vnet_address_space` are set. This module is crucial for setting up the foundational network infrastructure for the AKS cluster.

#### Integrating Cluster Module in Main Configuration

##### Configuration in `main.tf`
- **Module "cluster"**:
  - The cluster module's source path is defined along with essential input variables. These include `cluster_name`, `location`, `dns_prefix`, `kubernetes_version`, and service principal details. This module is central to creating and configuring the AKS cluster itself.

### Initializing and Applying Terraform Configuration

#### Steps
- **Initialize Terraform**: Run `terraform init` to prepare the project.
- **Apply Configuration**: Use `terraform apply` to create the infrastructure. This includes both networking resources and the AKS cluster.
- **Secure State File**: The Terraform state file is added to `.gitignore` for security.

By following these procedures, you can effectively use Terraform to create and manage a robust AKS cluster in Azure. This combination of detailed documentation and structured Terraform code ensures a streamlined and secure deployment process.

## Terraform AKS Cluster Management

### Managing the AKS Cluster
- After deploying the AKS cluster using Terraform, it is crucial to manage and interact with the cluster efficiently.
- **Azure CLI**: The Azure Command-Line Interface (CLI) is used for obtaining credentials to interact with the AKS cluster. For example, the command `az aks get-credentials --resource-group <resource-group-name> --name <your-aks-cluster-name>` configures the local `kubectl` environment to communicate with your AKS cluster.
- **Kubernetes Version**: To align with Azure's offerings and ensure compatibility, the Kubernetes version used in the cluster (e.g., `1.26.6`) is specified. This version should be periodically reviewed and updated as needed.
- **Verifying the Cluster**: Once connected, you can use `kubectl get nodes` to verify the nodes in your AKS cluster. This step confirms that the cluster is operational and that `kubectl` is correctly configured.

# Kubernetes Deployment for Flask Web Application

This document outlines the process and configuration used for deploying a Flask web application on an Azure Kubernetes Service (AKS) cluster using Kubernetes manifests, including the rationale behind the deployment strategy and how the application is tested and validated post-deployment.

## Deployment and Service Manifests

The Flask application is containerized using Docker and deployed to AKS with the following Kubernetes manifests:

- **Deployment Manifest**: Defined as `flask-app-deployment`, it manages the lifecycle of the application pods. The manifest specifies 2 replicas for high availability and uses a label selector `app: flask-app` to manage the pods. It points to the Docker image on Docker Hub, with the image version tagged as `latest`. Each pod exposes port 5000, which is the application's port.

- **Service Manifest**: Named `flask-app-service`, it creates an internal service of type `ClusterIP` within the AKS cluster. It uses the same label selector `app: flask-app` to route traffic to the correct pods. The service listens on port 80 and routes traffic to `targetPort` 5000 on the pods.

## Deployment Strategy

The deployment strategy chosen is `RollingUpdate`. This strategy incrementally updates pods instances with new ones, which are created and scheduled before the old ones are terminated. The key benefits of this strategy include:

- **Zero Downtime**: Ensures at least one instance of the pod is running, thus providing service continuity.
- **Rollback Capabilities**: If something goes wrong, Kubernetes will stop the rollout and rollback to the previous version.
- **Resource Efficiency**: Only a subset of resources are required during the update, which means that the system doesn't need to double its resource usage.

This strategy aligns with our application's requirement for high availability and the need for updates without service interruption.

## Testing and Validation

Post-deployment, the application was validated by:

- **Port Forwarding**: Temporary port forwarding to `localhost` allowed immediate interaction with the application for testing.
- **Internal Testing**: Navigating through the application's functionality, especially the orders table and Add Order feature, ensured that the application behaves as expected within the AKS cluster.
- **Log Inspection**: Checking the logs from the application's pods helped confirm there were no hidden issues.

## Internal Distribution

To distribute the application to other internal users without relying on port forwarding, we plan to:

- **Internal DNS**: Set up an internal DNS to point to the ClusterIP of the service.
- **Ingress Controller**: Implement an Ingress controller that provides HTTP routing to the service.
- **Access Policies**: Define RBAC policies to control access within the AKS cluster.

## External Access (If Needed)

Should the need arise to provide external access to the application, we will:

- **Change Service Type**: Update the service from `ClusterIP` to `LoadBalancer` to provide an external IP.
- **Implement Authentication**: Ensure the application has strong authentication and authorization mechanisms.
- **Use TLS**: Secure communication with the application using TLS encryption.

# CI/CD Pipeline Documentation

This document outlines the continuous integration and continuous deployment (CI/CD) pipeline for our project, detailing the configuration, settings, and validation steps. The pipeline is designed to integrate with Azure DevOps, Docker Hub, and Azure Kubernetes Service (AKS).

#### Key Steps:

- **Docker Build and Push:**
  - Builds the Docker image from the Dockerfile.
  - Pushes the image to Docker Hub using the service connection established with Docker Hub.
  - Tags the image with both latest and the specific `$(Build.BuildId)`.

### Release Pipeline

- Target: AKS

#### Key Steps:

- Applies Kubernetes deployment configurations from `path/to/application-manifest.yaml`.
- Utilizes the Azure Resource Manager service connection for deployments.

### Integration with Docker Hub

- Docker Repository: `softwaresimms/devops-project`

### Integration with AKS

- Cluster Name: `terraform-aks-cluster`
- Resource Group: `networking-resource-group`

## Validation Steps

To ensure the functionality of the application and the robustness of the CI/CD pipeline, the following validation steps were performed:

1. Monitored the status of pods in the AKS cluster post-deployment.
2. Initiated port forwarding using `kubectl` to access the application.
3. Accessed the application via the locally exposed address to verify correct operation.
4. Performed end-to-end application testing to validate all features and endpoints.

# AKS Cluster Monitoring Documentation

## Metrics Explorer Charts

- **Average Node CPU Usage**: Tracks CPU usage across nodes. Alert threshold: >80%.
- **Average Node Memory Working Set**: Monitors active memory usage. Alert threshold: >80%.
- **Disk Usage Percentage**: Measures used disk space to preempt storage issues. Alert threshold: >90%.
- **Network IO**: Observes network traffic for irregular patterns.

![Metrics Charts](path/to/metrics-charts-screenshot.png)

## Log Analytics Insights

### Sample Logs

```plaintext
# Node Resource Usage
TimeGenerated [DateTime], Node [NodeName], CPUUsageMillicores: [Value], MemoryWorkingSetMB: [Value]

# Pod Phase
TimeGenerated [DateTime], PodName [Name], Namespace [Namespace], Status: [Running | Pending | Failed]

# Container Warnings
TimeGenerated [DateTime], ContainerID [ID], LogMessage: [Warning message]
