cheatsheet do
  title 'HTTP Status Codes'
  docset_file_name 'HTTPStatusCodes'
  keyword 'status_codes'

  introduction <<-INTRO
HTTP status codes and their respective Rails shortcuts (if available). For example, `:not_found` can be used instead of `404` in a render call:

```ruby
render :file => '404.html.erb', :status => :not_found
```

This information was gleaned from *status_codes* on [cheat.errtheblog.com](http://cheat.errtheblog.com/) and [*List of HTTP status codes*](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) on Wikipedia.
INTRO

  category do
    id '1xx Informational'

    entry do
      command '100'
      command ':continue'
      name 'Continue'
      notes 'The server has received the request headers, and that the client should proceed to send the request body.'
    end

    entry do
      command '101'
      command ':switching_protocols'
      name 'Switching Protocols'
      notes 'The requester has asked the server to switch protocols and the server is acknowledging that it will do so.'
    end

    entry do
      command '102'
      command ':processing'
      name 'Processing'
      notes 'The server has received and is processing the request, but no response is available yet.'
    end
  end

  category do
    id '2xx Success'

    entry do
      command '200'
      command ':ok'
      name 'OK'
      notes 'The standard response for successful HTTP requests.'
    end

    entry do
      command '201'
      command ':created'
      name 'Created'
      notes 'The request has been fulfilled and a new resource has been created.'
    end

    entry do
      command '202'
      command ':accepted'
      name 'Accepted'
      notes 'The request has been accepted but has not been processed yet. This code does not guarantee that the request will process successfully.'
    end

    entry do
      command '203'
      command ':non_authoritative_information'
      name 'Non-Authoritative Information'
      notes 'HTTP 1.1. The server successfully processed the request but is returning information from another source.'
    end

    entry do
      command '204'
      command ':no_content'
      name 'No Content'
      notes 'The server accepted the request but is not returning any content. This is often used as a response to a `DELETE` request.'
    end

    entry do
      command '205'
      command ':reset_content'
      name 'Reset Content'
      notes 'Similar to a `204 No Content` response but this response requires the requestor to reset the document view.'
    end

    entry do
      command '206'
      command ':partial_content'
      name 'Partial Content'
      notes 'The server is delivering only a portion of the content, as requested by the client via a range header.'
    end

    entry do
      command '207'
      command ':multi_status'
      name 'Multi-Status'
      notes 'WebDAV - [RFC 4918](https://tools.ietf.org/html/rfc4918). The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.'
    end

    entry do
      command '208'
      name 'Already Reported'
      notes 'WebDAV - [RFC 5842](https://tools.ietf.org/html/rfc5842). The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.'
    end

    entry do
      command '226'
      name 'IM Used'
      notes '[RFC 3229](https://tools.ietf.org/html/rfc3229). The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.'
    end
  end

  category do
    id '3xx Redirection'

    entry do
      command '300'
      command ':multiple_choices'
      name 'Multiple Choices'
      notes 'There are multiple options that the client may follow.'
    end

    entry do
      command '301'
      command ':moved_permanently'
      name 'Moved Permanently'
      notes 'The resource has been moved and all futher requests should reference its new URI.'
    end

    entry do
      command '302'
      command ':found'
      name 'Found'
      notes 'The HTTP 1.0 specification described this status as "Moved Temporarily", but popular browsers respond to this status similar to behavior intended for `303`. The resource can be retrieved by referencing the returned URI.'
    end

    entry do
      command '303'
      command ':see_other'
      name 'See Other'
      notes 'The resource can be retrieved by following other URI using the `GET` method. When received in response to a `POST`, `PUT`, or `DELETE`, it can usually be assumed that the server processed the request successfully and is sending the client to an informational endpoint.'
    end

    entry do
      command '304'
      command ':not_modified'
      name 'Not Modified'
      notes 'The resource has not been modified since the version specified in `If-Modified-Since` or `If-Match` headers. The resource will not be returned in response body.'
    end

    entry do
      command '305'
      command ':use_proxy'
      name 'Use Proxy'
      notes 'HTTP 1.1. The resource is only available througha  proxy and the address is provided in the response.'
    end

    entry do
      command '306'
      name 'Switch Proxy'
      notes 'Deprecated in HTTP 1.1. Used to mean that subsequent requests should be sent using the specified proxy.'
    end

    entry do
      command '307'
      command ':temporary_redirect'
      name 'Temporary Redirect'
      notes 'HTTP 1.1. The request should be repeated with the URI provided in the response, but future requests should still call the original URI.'
    end

    entry do
      command '308'
      name 'Permanent Redirect'
      notes 'Experimental. The request and all future requests should be repeated with the URI provided in the response. The HTTP method is not allowed to be changed in the subsequent request.'
    end
  end

  category do
    id '4xx Client Error'

    entry do
      command '400'
      command ':bad_request'
      name 'Bad Request'
      notes 'The request could not be fulfilled due to the incorrect syntax of the request.'
    end

    entry do
      command '401'
      command ':unauthorized'
      name 'Unauthorized'
      notes 'The requestor is not authorized to access the resource. This is similar to `402` but is used in cases where authentication is expected but has failed or has not been provided.'
    end

    entry do
      command '402'
      command ':payment_required'
      name 'Payment Required'
      notes 'Reserved for future use. Some web services use this as an indication that the client has sent an excessive number of requets.'
    end

    entry do
      command '403'
      command ':forbidden'
      name 'Forbidden'
      notes "The request was formatted correctly but the server is refusing to supply the requested resource. Unlike `402`, authenticating will not make a difference in the server's response."
    end

    entry do
      command '404'
      command ':not_found'
      name 'Not Found'
      notes "The resource could not be found. This is often used as a catch-all for all invalid URIs requested of the server."
    end

    entry do
      command '405'
      command ':method_not_allowed'
      name 'Method Not Allowed'
      notes "The resource was requested using a method that is not allowed. For example, requesting a resource via a `POST` method when the resource only supports the `GET` method."
    end

    entry do
      command '406'
      command ':not_acceptable'
      name 'Not Acceptable'
      notes "The resource is valid, but cannot be provided in a format specified in the `Accept` headers in the request."
    end

    entry do
      command '407'
      command ':proxy_authentication_required'
      name 'Proxy Authentication Required'
      notes "Authentication is required with the proxy before requests can be fulfilled."
    end

    entry do
      command '408'
      command ':request_timeout'
      name 'Request Timeout'
      notes "The server timed out waiting for a request from the client. The client is allowed to repeat the request."
    end

    entry do
      command '409'
      command ':conflict'
      name 'Conflict'
      notes "The request cannot be completed due to a conflict in the request parameters."
    end

    entry do
      command '410'
      command ':gone'
      name 'Gone'
      notes "The resource is no longer available at the requested URI and no redirection will be given."
    end

    entry do
      command '411'
      command ':length_required'
      name 'Length Required'
      notes "The request did not specify the length of its content as required by the resource."
    end

    entry do
      command '412'
      command ':precondition_failed'
      name 'Precondition Failed'
      notes "The server does not meet one of the preconditions specified by the client."
    end

    entry do
      command '413'
      command ':request_entity_too_large'
      name 'Request Entity Too Large'
      notes "The request is larger than what the server is able to process."
    end

    entry do
      command '414'
      command ':request_uri_too_long'
      name 'Request-URI Too Long'
      notes "The URI provided in the request is too long for the server to process. This is often used when too much data has been encoded into the URI of a `GET` request and a `POST` request should be used instead."
    end

    entry do
      command '415'
      command ':unsupported_media_type'
      name 'Unsupported Media Type'
      notes "The client provided data with a media type that the server does not support."
    end

    entry do
      command '416'
      command ':requested_range_not_satisfiable'
      name 'Requested Rang Not Satisfiable'
      notes "The client has asked for a portion of the resource but the server cannot supply that portion."
    end

    entry do
      command '417'
      command ':expectation_failed'
      name 'Expectation Failed'
      notes "The client has asked for a portion of the resource but the server cannot supply that portion."
    end

    entry do
      command '422'
      command ':unprocessable_entity'
      name 'Unprocessable Entity'
      notes "WebDAV - [RFC 4918](https://tools.ietf.org/html/rfc4918). The request was formatted correctly but cannot be processed in its current form. Often used when the speceified parameters fail validation errors."
    end

    entry do
      command '423'
      command ':locked'
      name 'Locked'
      notes "WebDAV - [RFC 4918](https://tools.ietf.org/html/rfc4918). The requested resource was found but has been locked and will not be returned."
    end

    entry do
      command '424'
      command ':failed_dependency'
      name 'Failed Dependency'
      notes "WebDAV - [RFC 4918](https://tools.ietf.org/html/rfc4918). The request failed due to a failure of a previous request."
    end

    entry do
      command '426'
      command ':upgrade_required'
      name 'Upgrade Required'
      notes "The client should repeat the request using an upgraded protocol such as TLS 1.0."
    end

    entry do
      command '429'
      name 'Too Many Requests'
      notes "The client has sent too many requests to the server and is being rate limited."
    end
  end
end
