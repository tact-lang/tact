contract OptDefaults {
  a: Int? = null;
  b: String? = "foo";

  init() {
    self.a = 100;
    self.b = null;
  }
}