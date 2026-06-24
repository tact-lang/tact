contract OnlyOptionals {
  i: Int?;
  b: Bool?;
  s: String?;
  cl: Cell?;
  sl: Slice?;
  a: Address?;

  init() {
    self.i = null;
    self.b = null;
    self.s = null;
    self.cl = null;
    self.sl = null;
    self.a = null;
  }
}