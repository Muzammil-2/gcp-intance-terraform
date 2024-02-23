terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.17.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "ase2345"
  credentials = file("serviceac.json")
  region      = "var.region"
}

/*terraform {
  backend "gcs" {
    bucket  = "tf-state-prod"
    prefix  = "terraform/state"
  }
}
*/