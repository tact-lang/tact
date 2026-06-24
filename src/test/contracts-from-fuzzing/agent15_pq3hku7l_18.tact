message Inner {
  x: Int;
}

message Outer {
  inner: Inner;
}

contract Test {
  receive(msg: Outer) {
    let a = msg.inner.x;
  }
}