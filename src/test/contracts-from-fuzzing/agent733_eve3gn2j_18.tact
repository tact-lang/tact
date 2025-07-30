contract TestContract {
  a: Int?;
  b: Bool;
  c: String?;
  d: Int;

  init() {
    self.b = true;
    self.d = 99;
    // omit a and c, should default to null
  }
}