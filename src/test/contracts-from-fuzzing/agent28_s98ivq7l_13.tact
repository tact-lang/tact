struct Pair {
  a: Int;
  b: Int;
}

fun makePair(x: Int, y: Int): Pair {
  return Pair{a: x, b: y};
}

contract Test {
  receive() {
    makePair(1, 2);
  }
}