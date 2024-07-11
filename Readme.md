# Automated Deployment of a Streamlit Application on Azure

This document outlines the steps to set up an automated deployment process for a Streamlit web application on Azure using Terraform for infrastructure management and Azure DevOps for CI/CD.

## Overview

1. **Set Up Terraform Configuration**: Define the necessary Azure resources using Terraform.
2. **Create a Dockerfile**: Containerize the Streamlit application.
3. **Create Azure DevOps Pipelines**: Set up pipelines for Terraform and Docker operations.
4. **Run the Pipelines**: Execute the Terraform pipeline followed by the Docker pipeline.
5. **Access the Deployed Application**: Retrieve the URL of the deployed application and access it in a browser.

## Steps to Follow

### 1. Set Up Terraform Configuration

Create Terraform configuration files (`main.tf`, `variables.tf`, and `dev.tfvars`) and define the resources:

- Azure Resource Group
- Azure Container Registry (ACR)
- Azure App Service Plan
- Azure App Service

### 2. Create a Dockerfile

Define the Dockerfile to containerize the Streamlit application:

- Specify the base image (e.g., `python:3.9-slim`).
- Set the working directory and copy application files.
- Install necessary packages.
- Expose the application port.
- Define the entry point to run Streamlit.

### 3. Create Azure DevOps Pipelines

#### Service Connections Setup

**Terraform Service Connection**:

1. **Purpose**: Allows Azure DevOps pipeline to authenticate and interact with Azure subscription using Terraform.
2. **Setup**:
   - Create a service principal with Contributor role in Azure.
   - In Azure DevOps, go to **Project Settings** > **Service connections**.
   - Create a new service connection for **Azure Resource Manager**.
   - Provide subscription ID and service principal credentials.
   - Name the service connection (e.g., `Streamlit-Terraform`).

**Docker Registry Service Connection**:

1. **Purpose**: Allows Azure DevOps pipeline to push Docker images to Azure Container Registry (ACR).
2. **Setup**:
   - Create an ACR instance in Azure.
   - Ensure a service principal has permissions to push images.
   - In Azure DevOps, go to **Project Settings** > **Service connections**.
   - Create a new service connection for **Docker Registry**.
   - Choose **Azure Container Registry** and provide necessary details.
   - Name the service connection (e.g., `Streamlit-ACR`).

#### Define Pipelines

**Terraform Pipeline**:

1. **Trigger**: Set the pipeline to trigger on changes to the Terraform configuration files.
2. **Install Terraform**: Download and install Terraform in the pipeline.
3. **Initialize and Apply Terraform**: Run Terraform commands to initialize, plan, and apply the configuration.

**Docker Pipeline**:

1. **Trigger**: Set the pipeline to trigger on changes to the Dockerfile or application files.
2. **Build and Push Docker Image**: Build the Docker image and push it to ACR.
3. **Deploy to Azure App Service**: Deploy the Docker image from ACR to Azure App Service.

### 4. Run the Pipelines

- **Execute the Terraform Pipeline**: Run the pipeline to create Azure resources.
- **Execute the Docker Pipeline**: Run the pipeline to build the Docker image, push it to ACR, and deploy it to Azure App Service.

### 5. Access the Deployed Application

- **Retrieve URL**: Get the URL of the deployed web app from the Terraform pipeline output.
- **Access the Application**: Open the URL in a browser to access the Streamlit application.

## Detailed Steps with Azure DevOps

1. **Set Up Service Connections**:
   - **Terraform**: Create a service connection named `Streamlit-Terraform`.
   - **Docker Registry**: Create a service connection named `Streamlit-ACR`.

2. **Define Terraform Configuration**:
   - **main.tf**: Define Azure resources.
   - **variables.tf**: Define variables for resource names, locations, etc.
   - **dev.tfvars**: Provide values for the variables.

3. **Create the Dockerfile**:
   - Define the steps to set up and run the Streamlit application in a container.

4. **Create and Configure Pipelines**:
   - **Terraform Pipeline**: 
     - Install Terraform.
     - Initialize, plan, and apply the Terraform configuration.
   - **Docker Pipeline**:
     - Build and push the Docker image.
     - Deploy the image to Azure App Service.

5. **Execute Pipelines**:
   - Run the Terraform pipeline to create infrastructure.
   - Run the Docker pipeline to build and deploy the application.

6. **Verify Deployment**:
   - Get the web app URL from the Terraform pipeline output.
   - Access the URL in a browser to ensure the application is running.

By following these steps, you will have a fully automated deployment process for your Streamlit web application on Azure, utilizing Terraform for infrastructure provisioning and Azure DevOps for continuous integration and deployment.
