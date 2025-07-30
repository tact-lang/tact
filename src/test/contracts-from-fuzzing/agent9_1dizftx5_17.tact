struct S {
  x: Int;
}

message M {
  y: Int;
}

contract Test {
  receive() {
    let m: M = M { y: 3 };
    let s: S = S { x: 4 };
    dump(m.y + s.x);
  }
}