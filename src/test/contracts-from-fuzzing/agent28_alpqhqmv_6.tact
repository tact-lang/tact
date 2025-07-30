message NestedMessage {
  inner: InnerMessage
}

message InnerMessage {
  value: Int
}

contract Test {
  receive() {
    let m: NestedMessage = NestedMessage{inner: InnerMessage{value: 15}};
  }
}