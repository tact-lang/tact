message Nested {
  s: String;
}

message Outer {
  inner: Nested;
}

contract Test {
  receive(msg: Outer) {
    // do nothing
  }
}