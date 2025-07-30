fun add(a: Int, b: Int): Int {
  return a + b;
}

contract Test {
  receive() {
    add(1, 2);
  }
}