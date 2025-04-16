contract EdgeDefaults {
  a: Int;
  b: Int;
  c: Int = 3;
  d: Int?;

  init() {
    self.a = 1;
    self.b = 2;
    self.d = null;
  }
}