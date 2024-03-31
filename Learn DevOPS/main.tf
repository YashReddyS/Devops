provider "google" {
  credentials = file("learndevops-418907-a1cf66a93cb1.json")
  project     = "learndevops-418907"
  region      = "us-central1"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

}


resource "google_container_node_pool" "primary_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}


resource "google_storage_bucket" "terraform_state_bucket" {
  name     = "tfstate-bucket"
  location = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "your-terraform-state-bucket"
    prefix = "terraform/state"
  }
}