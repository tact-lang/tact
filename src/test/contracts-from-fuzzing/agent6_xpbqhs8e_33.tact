fun add(a: Int, b: Int): Int {
  return a + b;
}

contract Test {
  receive() {
    let res: Int = add(1, 2);
  }
}