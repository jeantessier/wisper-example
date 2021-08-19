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

## Problems

Events get published to a Kafka topic, but the Kafka message has an empty
`subscriber` section (actually an empty hash, `{}`).  This confuses the Kafka
consumer, which expects it to be a string instead.

Here is an example Kafka message:

```json
{
  "subscriber": {},
  "event": "echo",
  "args": [
    "world"
  ]
}
```

I suspect this is because I use a global subscriber, attached using
`Wisper.subscribe`, instead of subscribing to the producer directly.  In this
case, the subscriber is a controller, so I cannot really subscribe to it ahead
of time.

When I fed a message with the proper `subscriber` value, the consumer was able
to process it just fine.

This command injects the message on the Kafka topic:

```bash
kafkacat -P -b localhost -t wisper_events <<MSG
{"subscriber":"EchoSubscriber","event":"echo","args":["world"]}
MSG
```

This is the resulting message:

```json
{
  "subscriber": "EchoSubscriber",
  "event": "echo",
  "args": [
    "world"
  ]
}
```
