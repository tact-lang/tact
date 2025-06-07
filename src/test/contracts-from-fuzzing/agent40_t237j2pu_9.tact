message MyMessage {
  inner: Inner;
}

struct Inner {
  value: Int;
}

contract Test {
  receive(msg: MyMessage) {
    let v = msg.inner.value;
  }
}