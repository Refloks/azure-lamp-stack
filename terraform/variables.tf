variable "vm_size" {
  type    = string
  default = "Standard_B2als_v2"
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "admin_cidrs" {
  type = list(string)

  validation {
    condition = alltrue([
      for cidr in var.admin_cidrs : can(cidrnetmask(cidr))
    ])
    error_message = "All admin_cidrs must be valid CIDRs, e.g. 203.0.113.10/32."
  }
}
