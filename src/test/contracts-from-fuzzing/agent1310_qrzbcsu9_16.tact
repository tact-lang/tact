contract OptionalMix {
  i: Int?;
  b: Bool?;
  a: Address?;
  c: Cell?;
  s: Slice?;
  str: String?;
  init() {
    self.i = null;
    self.b = null;
    self.a = null;
    self.c = null;
    self.s = null;
    self.str = null;
  }
}