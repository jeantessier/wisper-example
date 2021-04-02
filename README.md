# Wisper Example

This example shows how to use the `wisper` gem for event-based processing.  See
[Wisper](https://github.com/krisleech/wisper) for more details.

A single `EchoController` publishes events.

A single subscriber listens for events.  It is registered in the `wisper.rb`
initializer.  It listens only to a single specific event type.

## Running the Server

You can start the application with:

> $ bin/rails server

And use the base URL http://localhost:3000/echo/index

`GET` requests will get echoed in the Rails logs, and all other events internal
to Rails will be listed there too.
