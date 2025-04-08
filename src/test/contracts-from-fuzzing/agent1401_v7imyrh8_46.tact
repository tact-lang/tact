contract InlineDefaults {
  a: Int = 1;
  b: Bool? = null;
  c: Bool? = true;

  init() {
    self.a = 10;
    self.b = true;
    self.c = false;
  }
}