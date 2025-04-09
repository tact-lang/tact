fun id(x: Int): Int {
  return x;
}

contract Test {
  receive() {
    let r = id(42);
  }
}