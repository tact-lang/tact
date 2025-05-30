contract OptionalPrimitiveFields {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Cell?;
  e: Address?;
  f: Slice?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
  }
}