fun add(a: Int, b: Int): Int {
  return a + b;
}

contract Test {
  receive() {
    let s = add(3, 4);
  }
}