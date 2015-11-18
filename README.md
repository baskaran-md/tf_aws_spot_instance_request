aws_spot_instance_request terraform module
=======================

A terraform module for requesting ec2 spot instances.
* Assumes you're making your instances in a VPC.
* Have a root instance of 25G GP2.

Module Input Variables
----------------------

- `ami_id` - The AMI to use
- `number_of_instances`  - The number of instances you want made
- `subnet_id - The VPC subnet to place the instance in
- `instance_type` - The EC2 instance type, e.g. m1.small
- `instance_name` - The instance name you want, this is used to populate
    the Name tag.
- `user_data` - The path to the user_data file. Terraform will include the contents of this file while launching the instance
- `tags` - A map for setting AWS tags.
- `spot_price` - The price to request on the spot market.
- `wait_for_fulfillment` -   (Optional; Default: false). If "true", Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached.
- `spot_type` - (Optional; Default: "persistent") If set to "one-time", after the instance is terminated, the spot request will be closed

Usage
-----

You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "ec2_instance" {
  source = "github.com/solarce/tf_aws_ec2_instance"
  instance_type = "${var.instance_type}"
  instance_name = "${var.instance_name}"
  ami_id = "${var.ami_id}"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  subnet_id = "${var.subnet_id}"
  number_of_instances = "${var.number_of_instances}"
  user_data = "{var.user_data}"
  spot_price = "${var.spot_price}"
  wait_for_fulfillment = "${var.wait_for_fulfillment}"
  spot_type = "${var.spot_type}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- aws_access_key
- aws_secret_key
- aws_region
- instance_name
- instance_type
- subnet_id
- ami_id
- number_of_instances
- spot_price
- wait_for_fulfillment
- spot_type

Authors
=======

Created and maintained by [Baskaran Deivasigamani](https://github.com/baskaran.md)
(baskaran.md@gmail.com).

License
=======

Apache 2 Licensed. See LICENSE for full details.
