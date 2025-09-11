terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "natural-motif-469318-d4"
  region  = "us-central1"
  zone    = "us-central1-c"
}
