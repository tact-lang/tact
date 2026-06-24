contract OptDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;

  init() {
    self.a = 10;
    self.b = false;
    self.c = "str";
  }
}