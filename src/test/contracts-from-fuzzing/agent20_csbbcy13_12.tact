message Outer {
  inner: Inner;
}

message Inner {
  value: Int;
}

contract Test {
  receive(msg: Outer) {
    let v = msg.inner.value + 1;
  }
}