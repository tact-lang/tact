fun example(x: Int): Int {
  return x;
}

contract Test {
  receive() {
    example(5);
  }
}