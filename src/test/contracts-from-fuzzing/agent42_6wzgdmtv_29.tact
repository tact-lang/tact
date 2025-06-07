// Explicit defaults and init override
contract MixedDefaults {
  a: Int = 1;
  b: Int;

  init() {
    self.a = 5;
    self.b = 7;
  }
}