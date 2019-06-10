[![Travis][travis-image]][travis-link]
[![Gitter][gitter-image]][gitter-link]
[![GitHub][github-image]][github-link]

  [travis-image]: https://travis-ci.org/squidfunk/terraform-aws-api-gateway-enable-cors.svg?branch=master
  [travis-link]: https://travis-ci.org/squidfunk/terraform-aws-api-gateway-enable-cors
  [codecov-image]: https://img.shields.io/codecov/c/github/squidfunk/terraform-aws-api-gateway-enable-cors/master.svg
  [codecov-link]: https://codecov.io/gh/squidfunk/terraform-aws-api-gateway-enable-cors
  [gitter-image]: https://badges.gitter.im/squidfunk/terraform-aws-api-gateway-enable-cors.svg
  [gitter-link]: https://gitter.im/squidfunk/terraform-aws-api-gateway-enable-cors
  [github-image]: https://img.shields.io/github/release/squidfunk/terraform-aws-api-gateway-enable-cors.svg
  [github-link]: https://github.com/squidfunk/terraform-aws-api-gateway-enable-cors/releases

# Terraform AWS API Gateway Enable CORS

A Terraform module to add an OPTIONS method to allow Cross-Origin Resource
Sharing (CORS) preflight requests.

## Usage

``` hcl
module "cors" {
  source = "github.com/squidfunk/terraform-aws-api-gateway-enable-cors"
  version = "0.3.0"

  api_id          = "<api_id>"
  api_resource_id = "<api_resource_id>"
}
```

By default, this will create a new `MOCK` endpoint on the provided API Gateway
resource allowing CORS preflight requests for **all methods** and
**all origins** by default. Of course this can be customized using variables
as stated in the next section.

## Configuration

The following variables can be configured:

### Required

#### `api_id`

- **Description**: API identifier
- **Default**: `none`

#### `api_resource_id`

- **Description**: API resource identifier
- **Default**: `none`

### Optional

#### `allow_headers`

- **Description**: Allow headers (`Access-Control-Allow-Headers`)
- **Default**:

    ``` hcl
    [
      "Authorization",
      "Content-Type",
      "X-Amz-Date",
      "X-Amz-Security-Token",
      "X-Api-Key"
    ]
    ```

#### `allow_methods`

- **Description**: Allow methods (`Access-Control-Allow-Methods`)
- **Default**:

    ``` hcl
    [
      "OPTIONS",
      "HEAD",
      "GET",
      "POST",
      "PUT",
      "PATCH",
      "DELETE"
    ]
    ```
#### `allow_origin`

- **Description**: Allow origin (`Access-Control-Allow-Origin`)
- **Default**: `"*"`

#### `allow_max_age`

- **Description**: Allow caching time (`Access-Control-Allow-Max-Age`)
- **Default**: `"7200"`

#### `allow_credentials`

- **Description**: Allow credentials (`Access-Control-Allow-Credentials`)
- **Default**: `none`

### Outputs

None.

## License

**MIT License**

Copyright (c) 2018-2019 Martin Donath

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
