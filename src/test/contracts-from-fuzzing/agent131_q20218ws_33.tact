contract MixedOptDefaults {
  a: Int? = null;
  b: Int = 5;
  c: Bool? = null;

  init() {
    self.a = 7;
    self.b = 42;
    self.c = true;
  }
}