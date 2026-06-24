struct S {
  a: Int;
  b: Bool;
}

contract Test {
  receive() {
    let s: S = S { a: 1, b: true };
  }
}