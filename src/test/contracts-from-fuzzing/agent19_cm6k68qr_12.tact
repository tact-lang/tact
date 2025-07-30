message Inner {
  value: Int;
}

message Outer {
  inner: Inner;
}

contract Test {
  receive(msg: Outer) {
    // empty
  }
}