struct Pair {
  a: Int;
  b: Bool;
}

contract Test {
  receive() {
    let p: Pair? = Pair{a: 1, b: true};
  }
}