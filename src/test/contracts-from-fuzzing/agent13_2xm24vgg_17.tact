struct Pair {
  x: Int;
  y: Int;
}

contract Test {
  receive() {
    Pair{x: 5, y: 6};
  }
}