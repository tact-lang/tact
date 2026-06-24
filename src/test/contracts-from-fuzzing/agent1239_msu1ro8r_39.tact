contract BoolDefaults {
  a: Bool = false;
  b: Bool = true;
  c: Bool? = null;
  d: Bool? = true;

  init() {
    self.a = true;
    self.b = false;
    self.c = false;
    self.d = null;
  }
}