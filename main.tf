terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
}

provider "yandex" {
  cloud_id  = "b1gi2dub94gh4fom520t"
  folder_id = "b1g323qfna5lftk2e8cs"
  zone      = "ru-central1-a"
  token     = "AQAAAAAzUm0QAATuweEug64y_Ey1pO10PLlilO8"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"

  network_interface {
    subnet_id = "e9btjeof0a99spaae3hd"
    nat       = true
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8mfc6omiki5govl68h"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./vm-one.pub")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "terraform2"

  network_interface {
    subnet_id = "e9btjeof0a99spaae3hd"
    nat       = true
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8mfc6omiki5govl68h"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./vm-two.pub")}"
  }
}
