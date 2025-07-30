struct Wrapped {
  inner: Another
}

message Another {
  x: Int
}

contract Test {
  receive() {}
}