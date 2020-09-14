
data "aws_availability_zones" "azs" {
  state = "available"
}

locals {
azs_name = "${data.aws_availability_zones.azs.names}"

}

resource "aws_vpc" "red_vpc" {
  cidr_block       = "${var.red_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "red_vpc.${terraform.workspace}"
  }
}

resource "aws_subnet" "red_pub_sn" {
    count = "${length(local.azs_name)}"
  vpc_id     = "${aws_vpc.red_vpc.id}"
  cidr_block = "${cidrsubnet(var.red_cidr, 8, count.index + 1)}"

  tags = {
    Name = "Red-Public-SN - 00${count.index + 1}"
    Environment = "${terraform.workspace}"
  }
  }