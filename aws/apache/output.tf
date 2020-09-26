output "instance_ips" {
  value = ["${aws_instance.apache.*.public_ip}"]
}