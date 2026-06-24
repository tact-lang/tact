struct S {
  a: Int?;
  b: Bool?;
}

contract NullInit {
  s: S;
  init() {
    self.s = S{ a: null, b: null };
  }
}