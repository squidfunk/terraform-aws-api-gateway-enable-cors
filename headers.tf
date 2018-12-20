locals {
  headers_map = "${
    map(
        "Access-Control-Allow-Headers"     , "'${join(",", var.allowed_headers)}'",
        "Access-Control-Allow-Methods"     , "'${join(",", var.allowed_methods)}'",
        "Access-Control-Allow-Origin"      , "'${var.allowed_origin}'",
        "Access-Control-Max-Age"           , "'${var.allowed_max_age}'",
        "Access-Control-Allow-Credentials" , "${var.allow_credentials ? "'true'" : ""}"
    )
  }"

  header_values = "${compact(values(local.headers_map))}"

  header_names = "${matchkeys(
      keys(local.headers_map),
      values(local.headers_map),
      local.header_values
    )}"

  parameters = "${formatlist("method.response.header.%s", local.header_names)}"
}
