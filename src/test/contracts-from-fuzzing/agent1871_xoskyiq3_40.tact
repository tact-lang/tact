contract OptionMismatch {
  a: Int?;
  b: Int;

  init() {
    self.a = null;
    self.b = 0;
  }
}