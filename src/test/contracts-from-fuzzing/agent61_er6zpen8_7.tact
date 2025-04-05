message InnerMessage {
  foo: Int;
}

message OuterMessage {
  innerMsg: InnerMessage;
}

contract Test {
  receive(message: OuterMessage) {
    // Do nothing
  }
}