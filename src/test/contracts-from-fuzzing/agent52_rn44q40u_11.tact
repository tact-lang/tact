message Data {
  a: Int;
  b: Int?;
}

contract Test {
  receive(msg: Data) {
    // process optional int
  }
}