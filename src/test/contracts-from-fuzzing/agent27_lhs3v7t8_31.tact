struct S {
  x: Int;
}

contract Test {
  receive() {
    let s: S = S{x:1};
    s.x = s.x + 1;
  }
}