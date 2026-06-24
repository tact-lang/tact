contract MixedDefaults {
  a: Int = 0;
  b: Bool = false;
  c: Address? = null;
  s: String = "";

  init() {
    self.a = 0;
    self.b = false;
    self.c = null;
    self.s = "";
  }
}