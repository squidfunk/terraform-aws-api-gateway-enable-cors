# Copyright (c) 2018-2019 Martin Donath <martin.donath@squidfunk.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

# -----------------------------------------------------------------------------
# Variables: API Gateway
# -----------------------------------------------------------------------------

# var.api_id
variable "api_id" {
  description = "API identifier"
}

# var.api_resource_id
variable "api_resource_id" {
  description = "API resource identifier"
}

# -----------------------------------------------------------------------------
# Variables: CORS-related
# -----------------------------------------------------------------------------

# var.allow_headers
variable "allow_headers" {
  description = "Allow headers"
  type        = "list"

  default = [
    "Authorization",
    "Content-Type",
    "X-Amz-Date",
    "X-Amz-Security-Token",
    "X-Api-Key",
  ]
}

# var.allow_methods
variable "allow_methods" {
  description = "Allow methods"
  type        = "list"

  default = [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "PATCH",
    "DELETE",
  ]
}

# var.allow_origin
variable "allow_origin" {
  description = "Allow origin"
  type        = "string"
  default     = "*"
}

# var.allow_max_age
variable "allow_max_age" {
  description = "Allow response caching time"
  type        = "string"
  default     = "7200"
}

# var.allowed_credentials
variable "allow_credentials" {
  description = "Allow credentials"
  default     = false
}
