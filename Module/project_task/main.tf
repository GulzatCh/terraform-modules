provider "aws" {
 region = "us-east-1"
  
}
 module "vpc_default" {
  source = "../modules/vpc"

 }
module "vpc_www" {
 source = "../modules/vpc"
 env = "www"
vpc_cidr = "10.5.0.0/16"
public_subnet_cidrs = ["10.5.1.0/24"]
private_subnet_cidrs = ["10.5.3.0/24", "10.5.4.0/24"]

}


output "public_subnet" {
 value = module.vpc_www.public_subnet_ids
  
}
output "private_subnet" {
 value = module.vpc_www.private_subnet_ids
  
}