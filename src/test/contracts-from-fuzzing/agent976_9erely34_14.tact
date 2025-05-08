struct S {
  a: Int = 1;
}

contract OptionalStructField {
  s: S?;
  init() {
    self.s = null;
  }
}