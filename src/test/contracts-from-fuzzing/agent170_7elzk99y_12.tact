contract MixedOptionals {
  a: Int?;
  b: Bool?;
  c: Cell?;
  d: Address?;
  e: Slice?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = null;
    self.e = null;
  }
}