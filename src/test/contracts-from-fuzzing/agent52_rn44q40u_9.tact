message Data {
  a: Int;
  b: Bool;
}

contract Test {
  receive(msg: Data) {
    // process
  }
}