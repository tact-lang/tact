contract OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "x";
  }
}