contract NoDefaults {
  a: Int;
  b: Bool;
  c: String;

  init() {
    self.a = -123;
    self.b = false;
    self.c = "test";
  }
}