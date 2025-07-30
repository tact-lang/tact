message Outer {
  inner: Inner;
}

message Inner {
  x: Int;
}

contract Test {
  receive(msg: Outer) {
    // process
  }
}