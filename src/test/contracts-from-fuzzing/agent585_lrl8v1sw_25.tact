struct S {
  x: Int? as uint32;
}

contract Test {
  s: S;
  init() {
    self.s = S{ x: null };
  }
}