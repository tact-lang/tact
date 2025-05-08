contract MixedDefaults {
  a: Int = 1;
  b: Bool;
  c: String = "string";
  init() {
    self.b = true;
  }
}