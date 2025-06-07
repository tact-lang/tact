// Many persistent optionals of different primitive types
contract AllOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Cell?;
  f: Slice?;
  g: Builder?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = myAddress();
    self.d = null;
    self.e = emptyCell();
    self.f = null;
    self.g = beginCell();
  }
}