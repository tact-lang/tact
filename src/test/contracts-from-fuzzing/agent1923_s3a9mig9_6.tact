contract OptionalPrimitives {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Builder?;
  g: Slice?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = null;
  }
}