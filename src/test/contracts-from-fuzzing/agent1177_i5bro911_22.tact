struct S {
  a: Int;
  b: Int?;
}

contract OptionalStructsTwoFields {
  s: S?;

  init() {
    self.s = null;
  }
}
