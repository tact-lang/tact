message M {
  a: Int;
  b: Int;
}

contract Test {
  receive(message: M) {
    return;
  }
}