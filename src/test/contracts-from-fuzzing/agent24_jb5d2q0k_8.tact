fun id(x: Bool): Bool {
  return x;
}

contract Test {
  receive() {
    let r = id(false);
  }
}