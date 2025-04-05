message Example {
  a: Int?;
}

message Example2 {
  a: Int?;
}

contract Test {
  receive(msg: Example) {
    // empty
  }
  receive(msg: Example2) {
    // empty
  }
}