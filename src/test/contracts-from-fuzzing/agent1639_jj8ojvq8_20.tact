struct S {
  f: Int;
}

contract NullStructField {
  s: S?;

  init() {
    self.s = null;
  }
}
