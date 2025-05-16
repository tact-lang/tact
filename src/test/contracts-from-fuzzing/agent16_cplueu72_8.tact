message Outer {
  inner: Inner;
}

struct Inner {
  data: Int;
}

contract Test {
  receive(msg: Outer) {
    let d = msg.inner.data;
  }
}