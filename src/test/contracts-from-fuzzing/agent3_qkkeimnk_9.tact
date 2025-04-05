struct Pair {
  a: Int;
  b: Bool;
}

fun mkPair(a: Int, b: Bool): Pair {
  return Pair { a: a, b: b };
}

contract Test {
  receive() {
    let p = mkPair(10, false);
  }
}