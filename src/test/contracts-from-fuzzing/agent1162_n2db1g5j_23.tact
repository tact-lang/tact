contract InlineDefaults {
  a: Int = 1;
  b: Bool;
  c: String = "x";
  d: Bool?;

  init() {
    self.b = true;
    self.d = null;
  }
}