contract OptionalDef {
  a: Int? = null;
  b: Bool? = false;
  s: String? = null;

  init() {
    self.a = 1;
    self.b = true;
    self.s = "hi";
  }
}