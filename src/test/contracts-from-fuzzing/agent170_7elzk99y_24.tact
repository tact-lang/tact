contract OptionalsAll {
  i: Int?;
  b: Bool?;
  a: Address?;
  s: String?;
  c: Cell?;
  sl: Slice?;

  init() {
    self.i = 1;
    self.b = null;
    self.a = null;
    self.s = null;
    self.c = emptyCell();
    self.sl = null;
  }
}