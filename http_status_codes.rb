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

end
