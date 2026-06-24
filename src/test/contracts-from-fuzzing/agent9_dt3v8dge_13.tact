struct Pair {
  a: Int;
  b: String;
}

fun makePair(x: Int, y: String): Pair {
  return Pair { a: x, b: y };
}

contract Test {
  receive() {
    let p = makePair(1, "hello");
  }
}