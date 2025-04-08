contract OptionalPrimitives {
  i: Int?;
  b: Bool?;
  s: String?;
  a: Address?;

  init() {
    self.i = null;
    self.b = null;
    self.s = null;
    self.a = null;
  }
}