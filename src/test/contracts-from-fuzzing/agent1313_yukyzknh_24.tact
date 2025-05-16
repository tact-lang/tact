contract ManyDefaults {
  i: Int = 3;
  b: Bool = true;
  s: String = "hello";

  init() {
    self.i = 5;
    self.b = false;
    self.s = "world";
  }
}