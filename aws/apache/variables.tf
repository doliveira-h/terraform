variable "ami-name" {
  description = "AMI Name"  
  default = "ami-07ebfd5b3428b6f4d"
}

variable "instance_type" {
  description = "AWS Instance Type"    
  default = "t2.micro"
}

variable "key_name" {
  description = "AWS KeyName"    
}