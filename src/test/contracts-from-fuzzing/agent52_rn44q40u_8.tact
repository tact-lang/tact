message Ping {
}

message Pong {
  replyTo: Ping;
}

contract Test {
  receive(msg: Ping) {
    // ping received
  }
  receive(msg: Pong) {
    // pong received
  }
}