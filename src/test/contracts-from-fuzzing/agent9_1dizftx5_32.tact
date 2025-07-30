struct S {
  x: Int;
}

contract Test {
  receive() {
    let s: S = S { x: 1 };
    dump(s.x);
  }
}