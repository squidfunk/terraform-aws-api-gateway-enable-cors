# Copyright (c) 2018-2020 Martin Donath <martin.donath@squidfunk.com>

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
# Resources: API Gateway
# -----------------------------------------------------------------------------

# aws_api_gateway_method._
resource "aws_api_gateway_method" "_" {
  rest_api_id   = var.api_id
  resource_id   = var.api_resource_id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

# aws_api_gateway_integration._
resource "aws_api_gateway_integration" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method
  content_handling = "CONVERT_TO_TEXT"

  type = "MOCK"

  request_templates = {
    "application/json" = "{ \"statusCode\": 200 }"
  }
}

# aws_api_gateway_integration_response._
resource "aws_api_gateway_integration_response" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method
  status_code = 200

  response_parameters = local.integration_response_parameters

  depends_on = [
    aws_api_gateway_integration._,
    aws_api_gateway_method_response._,
  ]
}

# aws_api_gateway_method_response._
resource "aws_api_gateway_method_response" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method
  status_code = 200

  response_parameters = local.method_response_parameters

  response_models = {
    "application/json" = "Empty"
  }

  depends_on = [
    aws_api_gateway_method._,
  ]
}
