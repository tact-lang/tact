struct S {
  a: Int?;
}

contract NullInitDefault {
  s: S;

  init() {
    self.s = S{ a: null };
  }
}