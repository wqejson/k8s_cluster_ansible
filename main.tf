#Setup ssh connection variables
# variable "gce_ssh_user" {

# }
# variable "gce_ssh_pub_key_file" {

# }


// Configure the Google Cloud provider
provider "google" {
 credentials = file("studycloud-336513-7694bde45b80.json")
 project     = "studycloud-336513"
 region      = "europe-central2-a"
}



// almalinux's master node
resource "google_compute_instance" "almalinux-master-node-1" {
 name         = "alma-master-node-1"
 machine_type = "e2-standard-2"
 zone         = "europe-central2-a"

 boot_disk {
   initialize_params {
     image = "almalinux-cloud/almalinux-8"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo dnf update; sudo dnf install -yq build-essential python-pip rsync;"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
  metadata = {
    ssh-keys = "deploy:${file("id_rsa.pub")}"
  }

}


// almalinux's second worker
resource "google_compute_instance" "almalinux-worker-node-1" {
 name         = "alma-worker-node-1"
 machine_type = "e2-standard-2"
 zone         = "europe-central2-a"

 boot_disk {
   initialize_params {
     image = "almalinux-cloud/almalinux-8"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo dnf update; sudo dnf install -yq build-essential python-pip rsync;"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
  metadata = {
    ssh-keys = "deploy:${file("id_rsa.pub")}"
  }
}


// almalinux's second worker
resource "google_compute_instance" "almalinux-worker-node-2" {
 name         = "alma-worker-node-2"
 machine_type = "e2-standard-2"
 zone         = "europe-central2-a"

 boot_disk {
   initialize_params {
     image = "almalinux-cloud/almalinux-8"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo dnf update; sudo dnf install -yq build-essential python-pip rsync;"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
  metadata = {
    ssh-keys = "deploy:${file("id_rsa.pub")}"
  }
}

resource "google_compute_instance" "mongodb-master-01" {
 name         = "mongodb-master-01"
 machine_type = "e2-standard-2"
 zone         = "europe-central2-a"

 boot_disk {
   initialize_params {
     image = "centos-cloud/centos-7"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo dnf update; sudo dnf install -yq build-essential python-pip rsync;"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
  metadata = {
    ssh-keys = "deploy:${file("id_rsa.pub")}"
  }
}



resource "google_compute_instance" "mongodb-02" {
 name         = "mongodb-02"
 machine_type = "e2-standard-2"
 zone         = "europe-central2-a"

 boot_disk {
   initialize_params {
     image = "centos-cloud/centos-7"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo dnf update; sudo dnf install -yq build-essential python-pip rsync;"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
  metadata = {
    ssh-keys = "deploy:${file("id_rsa.pub")}"
  }
}

//need to add VPN connection to the cluster