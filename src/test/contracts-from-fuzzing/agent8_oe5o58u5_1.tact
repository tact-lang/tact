
struct Inner {
  a: Int;
}

message Outer {
  inner: Inner;
}

contract Test {
  receive(msg: Outer) {
    let value = msg.inner.a;
  }
}
