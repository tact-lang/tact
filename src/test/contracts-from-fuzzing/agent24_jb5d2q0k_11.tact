struct Pair {
  a: Int;
  b: Int;
}

contract Test {
  receive() {
    let p = Pair { a: 1, b: 2 };
  }
}