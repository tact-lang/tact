struct S {
  a: Int;
  b: Int;
}

contract Test {
  receive() {
    let s: S = S{a: 1, b: 2};
  }
}