#----------------
# General Vars
#----------------
variable "server_image" {
  type        = string
  description = "Name of the image to use for the server"
  default     = "debian-11"
}

variable "server_location" {
  type        = string
  description = "Where to place the server?"
  validation {
    error_message = "The server_location must be one of [\"fsn1\",\"nbg1\",\"ash\",\"hel1\"]."
    condition     = can(regex("(ash|hel1|nbg1|fsn1)", var.server_location))
  }
}

variable "server_type" {
  type        = string
  default     = "cx11"
  description = "Server size by type"
}

#----------------
# Toggle Vars
# Switch things on and off
#----------------
variable "enable_server_backups" {
  type        = bool
  default     = false
  description = "Wether to enable server backups in hcloud."
}

#----------------
# Naming
#----------------
variable "server_ptr_record" {
  type        = string
  description = "FQDN to add to PTR record"
  default     = ""
}

variable "server_name" {
  type        = string
  description = "Name of the server we create"
}

variable "common_labels" {
  type        = map(string)
  default     = {}
  description = "Map of labels to add to all resources"
}

#----------------
# Networking
#----------------
variable "firewall_rules" {
  type = list(object({
    port       = number
    protocol   = string
    direction  = string
    source_ips = list(string)
  }))
  default     = []
  description = "Additional firewall rules to add to the server (ssh and ping is already allowed)"
}

#----------------
# SSH Vars
#----------------
variable "admin_user" {
  type        = string
  default     = "ci"
  description = "Name of an admin user initially created on the server"

}

variable "ssh_port" {
  type        = number
  description = "SSH port to configure on server"
  default     = 22
}

variable "ssh_keys" {
  type        = list(string)
  description = "List of ssh keys to add to the admin_user"
}

variable "root_ssh_key_ids" {
  type        = list(string)
  description = "List of IDs of precreated ssh_keys that should be added to root account of server (empty means you get the root password via mail)"
  default     = []
}
