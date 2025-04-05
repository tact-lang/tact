message M {
  v: Int;
}

struct S {
  x: M;
}

contract Test {
  receive() {
    let s = S{x: M{v: 7}};
  }
}