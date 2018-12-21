locals {
  # evaluating cors headers map
  headers_map = "${
    map(
        "Access-Control-Allow-Headers"     , "'${join(",", var.allowed_headers)}'",
        "Access-Control-Allow-Methods"     , "'${join(",", var.allowed_methods)}'",
        "Access-Control-Allow-Origin"      , "'${var.allowed_origin}'",
        "Access-Control-Max-Age"           , "'${var.allowed_max_age}'",
        "Access-Control-Allow-Credentials" , "${var.allow_credentials ? "'true'" : ""}"
    )
  }"

  # pick nonampty headers values
  header_values = "${compact(values(local.headers_map))}"

  # pick header names that have values
  header_names = "${matchkeys(
      keys(local.headers_map),
      values(local.headers_map),
      local.header_values
    )}"

  # parameter names for method and integration responses
  parameter_names = "${formatlist("method.response.header.%s", local.header_names)}"

  # integration response parameters
  integration_parameters = "${zipmap(
      local.parameter_names,
      local.header_values
  )}"

  # map parameter list to "true" values
  true_list = "${split("|", replace(join("|", local.parameter_names), "/[^|]+/", "true"))}"

  # method response parameters
  method_parameters = "${zipmap(
      local.parameter_names,
      local.true_list
  )}"
}
