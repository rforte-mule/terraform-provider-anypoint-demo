variable cplane {
  type        = string
  default     = ""
  description = "Anypoint control plane. Possible values are us, eu or gov"
}

variable username {
  type        = string
  default     = ""
  description = "the username of the anypoint user"
}

variable password {
  type        = string
  default     = ""
  description = "the password of the anypoint user"
}

variable root_org {
  type        = string
  default     = ""
  description = "the anypoint root organization id"
}