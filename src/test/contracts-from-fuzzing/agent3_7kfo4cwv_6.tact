struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  x: Int;
  y: S1;
}

contract OptionalInNested {
  outer: S2?;

  init() {
    self.outer = null;
  }

  receive() {}
}