# Wisper Example

This example shows how to use the `wisper` gem for event-based processing.  See
[Wisper](https://github.com/krisleech/wisper) for more details.

A single `EchoController` publishes events.

A single subscriber listens for events.  It is registered in the `wisper.rb`
initializer.  It listens only to a single specific event type.

## Running the Server

You can start the application with:

    $ bin/rails server

And run Sidekiq in a separate shell with:

    $ bundle exec sidekiq

> Sidekiq will need access to Redis, by default on `localhost`.

And use the base URL http://localhost:3000/echo/index

`GET` requests will get echoed in the Sidekiq logs.
