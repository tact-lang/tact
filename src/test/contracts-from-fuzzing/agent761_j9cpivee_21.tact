contract OptionalsFirstThenNon {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int;
  e: Int;

  init() {
    self.a = null;
    self.b = null;
    self.c = 3;
    self.d = 4;
    self.e = 5;
  }
}