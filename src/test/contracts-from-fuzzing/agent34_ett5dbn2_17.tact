message M {
  f: Int;
}

contract Test {
  receive(msg: M) {
    // do nothing
  }
  receive() {
    // fallback
  }
}