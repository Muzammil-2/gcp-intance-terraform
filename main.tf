/*resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}
*/
resource "google_compute_instance" "instance" {
  machine_type = var.machine_type
  zone         = var.zone
  count        = var.node_count
  name         = var.instance_name[count.index]


  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  /*  scratch_disk {
    interface = "NVME"
  }
*/
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  /*  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  
  }
*/
}
