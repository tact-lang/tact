struct Pair {
  a: Int;
  b: Int;
}

fun makePair(a: Int, b: Int): Pair {
  return Pair { a: a, b: b };
}

contract Test {
  receive() {
    let p: Pair = makePair(1, 2);
  }
}