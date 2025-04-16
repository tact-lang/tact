message NestedMessage {
  inner: SimpleMessage;
}

message SimpleMessage {
  amount: Int;
}

contract Test {
  receive(msg: NestedMessage) {
    let a = msg.inner.amount;
  }
}