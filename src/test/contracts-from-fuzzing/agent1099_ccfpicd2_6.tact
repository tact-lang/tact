contract MixedOptionals {
  a: Int?;
  b: Bool?;
  c: Int;
  d: Bool;

  init() {
    self.a = 5;
    self.b = null;
    self.c = 7;
    self.d = true;
  }
}