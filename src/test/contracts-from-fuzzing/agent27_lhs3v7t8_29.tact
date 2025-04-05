struct S {
  a: Int;
}

contract Test {
  receive() {
    let s: S = S{a:1};
    s.a = 2;
  }
}