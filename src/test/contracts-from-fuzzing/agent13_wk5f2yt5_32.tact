fun id(x: Int): Int {
  return x;
}

contract TypeTest {
  receive() {
    id(42);
  }
}