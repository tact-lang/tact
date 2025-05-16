contract OptionalsChain {
  a: Int?;
  b: Int?;
  c: Int?;

  init() {
    self.a = null;
    self.b = self.a; // null
    self.c = self.b; // null
  }
}