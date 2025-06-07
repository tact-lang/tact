struct S {
  a: Int;
  b: Bool;
}

contract Test {
  receive() {
    let s: S = S { a: 5, b: true };
    s.a = 10;
  }
}