terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.70.0"
    }
  }
}

provider "google" {
  credentials = file("gcloud.json")
  project = "potent-cedar-316011"
  region  = "europe-west3" //frankfurt
  zone    = "europe-west3-c"
}


resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  metadata = {
   ssh-keys = "admin:${file("~/.ssh/id_rsa.pub")}"
 }

}
