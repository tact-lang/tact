struct S {
  a: Int;
  b: Int;
}

contract Test {
  receive() {
    let data: S = S{ a: 1, b: 2 };
  }
}