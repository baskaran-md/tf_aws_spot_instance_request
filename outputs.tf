// Output the ID of the EC2 instance created
output "instance_id" {
  value = "${join(",", aws_spot_instance_request.ec2_spot_instance.*.id)}"
}

output "spot_request_state" {
  value = "${join(",", aws_spot_instance_request.ec2_spot_instance.*.spot_request_state)}"
}

output "spot_instance_id" {
  value = "${join(",", aws_spot_instance_request.ec2_spot_instance.*.spot_instance_id)}"
}

output "spot_bid_status" {
  value = "${join(",", aws_spot_instance_request.ec2_spot_instance.*.spot_bid_status)}"
}
