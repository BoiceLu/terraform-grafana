variable "project" {
  default = "wide-retina-342307"
 }

variable "credentials_file" {
  default = "./wide-retina-342307-8d9decdaed49.json"
}

variable "region" {
  default = "asia-east1"
}

variable "zone" {
  default = "asia-east1-b"
}

data "template_file" "docker-script-build" {
  template = "${file("templates/docker-script-build.tpl")}"
}

data "template_file" "execute-shell" {
  template = "${file("templates/execute-shell.tpl")}"
}

data "template_file" "ssh-priv-build" {
  template = "${file("templates/ssh-priv-build.tpl")}"
}

data "template_file" "known_host" {
  template = "${file("templates/known_host.tpl")}"
}