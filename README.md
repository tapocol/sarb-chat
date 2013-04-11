# Socket Action Ruby Chat

An example app using Socket Action Ruby (sarb) to showcase a simple chat app.

## Usage

After git clone and cd to directory:

```bash
$ bundle
$ ruby app.rb
```

Javascript Console 1:

```javascript
var ws = new WebSocket("ws://127.0.0.1:8080/")
ws.onmessage = function(message) { console.log(message) };
ws.send(JSON.stringify({ action: "chat", args: { "chat": "Hello" } })) // Should receive message stating "You must auth first"
ws.send(JSON.stringify({ action: "auth", args: { "name": "Craig" } }))
ws.send(JSON.stringify({ action: "chat", args: { "chat": "sudo Hello" } })) // No message received now. I set up app.rb to send to all users except the one sending it.
```

Javascript Console 2:

```javascript
var ws = new WebSocket("ws://127.0.0.1:8080/")
ws.onmessage = function(message) { console.log(message) };
ws.send(JSON.stringify({ action: "auth", args: { "name": "Other Guy" } }))
ws.send(JSON.stringify({ action: "chat", args: { "chat": "Hi" } }))
```

Back to Javascript Console 1 (you have a message waiting, probably should reply):

```javascript
// Should receive message stating "Other Guy: Hi"
ws.send(JSON.stringify({ action: "chat", args: { "chat": "Hello" } }))
```

Back to Javascript Console 2 (OMG, someone is talking to you):

```javascript
// Should receive message stating "Craig: Hello"
```

Feel free to continue your dirty discussions with yourself in your own private chat sockets.

## License

The MIT License - Copyright (c) 2012-2013 Craig Jackson

