variable "subscription_id" {
  description = "The subscription ID in which resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-streamlit-dev-us-east-001"
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "acrstreamlitdev001"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "asp-streamlit-dev-us-east-001"
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
  default     = "app-streamlit-dev-us-east-001"
}

variable "docker_image_name" {
  description = "The name of the Docker image"
  type        = string
  default     = "streamlit-webapp"
}

variable "docker_image_tag" {
  description = "The tag of the Docker image"
  type        = string
  default     = "12"
}

variable "environment" {
    description = "The name of environment"
    type = string
    default = "dev"
  
}

variable "sku" {
   default = "Standard"
}

variable "os_type" {
description = "Type of operating system"
default = "Linux"
}

variable "sku_name" {
  description = "The name of SKU"
  default = "S1"
}