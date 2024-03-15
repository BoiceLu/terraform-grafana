terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "default"{
  name         = "grafana2"
  machine_type = "f1-micro"
  zone         = var.zone
  tags = ["ssh","http-server","https-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }


 metadata = {
  startup-script = <<SCRIPT
  ${data.template_file.docker-script-build.rendered}
  ${data.template_file.ssh-priv-build.rendered}
  ${data.template_file.known_host.rendered}
  ${data.template_file.execute-shell.rendered}
  SCRIPT
  sshKeys = "boicelu:${file("./id_rsa.pub")}"
 }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
      nat_ip = "35.206.237.142"
    }
  }

}












