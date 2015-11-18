// Provider specific configs
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

// EC2 Instance Resource for Module
resource "aws_spot_instance_request" "ec2_spot_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    user_data = "${file(var.user_data)}"

    spot_price = "${var.spot_price}"
    wait_for_fulfillment = "${var.wait_for_fulfillment}"
    spot_type = "${var.spot_type}"

    tags {
        created_by = "${lookup(var.tags,"created_by")}"
        // Takes the instance_name input variable and adds
        //  the count.index to the name., e.g.
        //  "example-host-web-1"
        Name = "${var.instance_name}-${count.index}"
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = 25
        delete_on_termination =  true
    }

}