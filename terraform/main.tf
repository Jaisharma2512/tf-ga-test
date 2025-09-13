terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }

  backend "gcs" {
    bucket = "tfkistate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "natural-motif-469318-d4"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_address" "static_ip" {
  name   = "boxip"
  region = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "box"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["dabba"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
