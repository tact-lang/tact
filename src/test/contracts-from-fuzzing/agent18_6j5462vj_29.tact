contract OptNullFields {
  s: String?;
  b: Bool?;
  a: Address?;
  ce: Cell?;
  sl: Slice?;

  init() {
    self.s = null;
    self.b = null;
    self.a = null;
    self.ce = null;
    self.sl = null;
  }
}