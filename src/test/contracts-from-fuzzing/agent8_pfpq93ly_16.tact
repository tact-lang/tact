message Inner {
  x: Int;
}

message Outer {
  maybeInner: Inner?;
}

contract Test {
  receive() {}
}