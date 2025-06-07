message M {
  f: Int;
}

struct S {
  m: M;
}

contract Test {
  receive() {
    // do nothing
  }
}