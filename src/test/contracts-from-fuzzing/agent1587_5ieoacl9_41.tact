struct S {
  a: Int?;
}

contract NullAsDefault {
  s: S;

  init() {
    self.s = S{};
  }
}