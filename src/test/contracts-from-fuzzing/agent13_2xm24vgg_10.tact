struct S {
  a: Int;
}

contract Test {
  receive() {
    S{a: 2};
  }
}