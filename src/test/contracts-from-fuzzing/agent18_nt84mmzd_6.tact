message Outer {
  a: Int;
  inner: Inner;
}

message Inner {
  b: Bool;
}

contract Test {
  receive(msg: Outer) {
    let x = msg.inner.b;
  }
}