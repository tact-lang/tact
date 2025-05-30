message Inner {
  i: Int;
}

message Outer {
  inner: Inner;
}

contract Test {
  receive() {
    // do nothing
  }
}