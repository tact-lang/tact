message Base {
  x: Int;
}

message Wrapper {
  inner: Base?;
}

contract Test {
  receive(message: Wrapper) {
    return;
  }
}