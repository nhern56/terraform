terraform {
  cloud {
    organization = "demo123456--"
    workspaces {
      tags = ["td"]
    }
  }
} 

