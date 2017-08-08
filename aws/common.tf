data "aws_availability_zones" "all" {}

data "aws_availability_zone" "all" {
  count = "${length(data.aws_availability_zones.all.names)}"
  name  = "${data.aws_availability_zones.all.names[count.index]}"
}

data "aws_route53_zone" "main" {
  zone_id = "${var.route53_zone_id}"
}

data "aws_route53_zone" "inaddr_arpa" {
  zone_id = "${var.route53_inaddr_arpa_zone_id}"
}

data "aws_vpc" "main" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "private" {
  count = "${length(var.private_subnets)}"
  id    = "${var.private_subnets[count.index]}"
}

data "aws_subnet" "public" {
  count = "${length(var.public_subnets)}"
  id    = "${var.public_subnets[count.index]}"
}
