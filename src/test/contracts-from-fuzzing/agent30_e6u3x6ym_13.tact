struct S {
  p: Int?;
}

contract Test {
  vals: S;

  init() {
    self.vals = S{ p: null };
  }
}