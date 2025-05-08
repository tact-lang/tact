contract OptionalsDefaults {
  a: Int?;
  b: Bool? = null;
  c: String? = "hello";

  init() {
    self.a = 5;
    self.b = true;
    self.c = null;
  }
}