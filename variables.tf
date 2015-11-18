// Module specific variables

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "instance_type" {}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
}

variable "ami_id" {
  description = "The AMI to use"
}

variable "number_of_instances" {
  description = "number of instances to make"
  default = 1
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}

variable "spot_price" {
  description = "The price to request on the spot market."
}

variable "wait_for_fulfillment" {
  description = "Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached."
  default = "false"
}

variable "spot_type" {
  description = "If set to 'one-time', after the instance is terminated, the spot request will be closed"
  default = "persistent"
}

// Variables for providers used in this module
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
