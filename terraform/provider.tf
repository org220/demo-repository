terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "5.97.0"
   }
 }
 backend "s3" {
   bucket         = "backend-terrafrom-bucket"
   key            = "terrafrom.state"
   region = "us-east-1"
   dynamodb_table = "terraform-state-lock"  # Enable state locking
 }
}
