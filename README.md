# Wisper Example

This example shows how to use the `wisper` gem for event-based processing.  See
[Wisper](https://github.com/krisleech/wisper) for more details.

A single `EchoController` publishes events.

A single subscriber listens for events.  It is registered in the `wisper.rb`
initializer.  It listens only to a single specific event type.

## Running the Server

You can start the application with:

```bash
bin/rails server
```

And start the Kafka consumer with:

```bash
bundle exec racecar WisperKafka::Consumer
```

## Sample Calls

And use the base URL http://localhost:3000/echo/index

`GET` requests will get echoed in the logs.

```bash
http :3000/echo/index
```

```bash
http :3000/echo/index name=='Jean Tessier'
```

As will `POST` requests.

```bash
http POST :3000/echo/index
```

```bash
http :3000/echo/index name='Jean Tessier'
```
