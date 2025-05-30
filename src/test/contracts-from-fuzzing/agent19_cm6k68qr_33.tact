message Example {
  a: Int?;
  b: String?;
}

contract Test {
  receive(msg: Example) {
    // empty
  }
}
