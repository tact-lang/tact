fun add(a: Int, b: Int): Int {
  return a + b;
}

contract TypeTest {
  receive() {
    add(1, 2);
  }
}