fun nested(a: Int, b: Bool): Bool {
  return b;
}

contract Test {
  receive() {
    let x = nested(42, true);
  }
}