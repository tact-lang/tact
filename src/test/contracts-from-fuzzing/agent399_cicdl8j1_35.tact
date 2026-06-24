contract MixedPrimitivesOptional {
  i: Int?;
  b: Bool?;
  a: Address?;
  c: Cell?;
  s: String?;
  sl: Slice?;

  init() {
    self.i = null;
    self.b = null;
    self.a = null;
    self.c = null;
    self.s = null;
    self.sl = null;
  }
}