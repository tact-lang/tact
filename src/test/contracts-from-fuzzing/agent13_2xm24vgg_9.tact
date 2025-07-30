message M {
  a: Int;
}

contract Test {
  receive() {
    M{a: 2};
  }
}