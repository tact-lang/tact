contract MixedDefaults {
  a: Int = 10;
  b: Bool = true;
  c: Int;
  d: Bool;

  init() {
    self.c = 20;
    self.d = false;
  }
}