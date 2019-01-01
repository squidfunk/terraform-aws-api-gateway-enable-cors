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
# Locals
# -----------------------------------------------------------------------------

# local.*
locals {
  headers = "${
    map(
      "Access-Control-Allow-Headers"    , "'${join(",", var.allow_headers)}'",
      "Access-Control-Allow-Methods"    , "'${join(",", var.allow_methods)}'",
      "Access-Control-Allow-Origin"     , "'${var.allow_origin}'",
      "Access-Control-Max-Age"          , "'${var.allow_max_age}'",
      "Access-Control-Allow-Credentials", "${var.allow_credentials ? "'true'" : ""}"
    )
  }"

  # Pick non-empty header values
  header_values = "${compact(values(local.headers))}"

  # Pick names that from non-empty header values
  header_names = "${matchkeys(
    keys(local.headers),
    values(local.headers),
    local.header_values
  )}"

  # Parameter names for method and integration responses
  parameter_names = "${
    formatlist("method.response.header.%s", local.header_names)
  }"

  # Map parameter list to "true" values
  true_list = "${
    split("|", replace(join("|", local.parameter_names), "/[^|]+/", "true"))
  }"

  # Integration response parameters
  integration_response_parameters = "${zipmap(
    local.parameter_names,
    local.header_values
  )}"

  # Method response parameters
  method_response_parameters = "${zipmap(
    local.parameter_names,
    local.true_list
  )}"
}
