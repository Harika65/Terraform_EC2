provider "aws" {
 region = "ap-south-1"
 access_key = data.vault_generic_secret.aws.data["access_key"]
 secret_key = data.vault_generic_secret.aws.data["secret_key"]
}

provider "vault" {
    address = "http://127.0.0.1:8200"
    token = var.mytoken
}

data "vault_generic_secret" "aws" {
path = "secret/aws"
}

variable "mytoken" {
    type = string
    sensitive = true
    
}