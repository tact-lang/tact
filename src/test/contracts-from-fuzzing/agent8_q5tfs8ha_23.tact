fun example(x: Int): Bool {
  return false;
}

contract Test {
  receive() {
    example(5);
  }
}