message M {
  s: Int;
}

struct S {
  m: M;
}

contract Test {
  receive() {
    let s = S{ m: M{ s: 5 } };
  }
}