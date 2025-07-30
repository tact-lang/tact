struct Inner {
  x: Int
}

message Outer {
  inner: Inner
}

contract Test {
  receive() {
    // do nothing
  }
}