message M {
  x: Int;
}

struct S {
  maybeMessage: M?;
}

contract Test {
  receive() {}
}