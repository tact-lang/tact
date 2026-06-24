contract OptionalVars {
  a: Int?;
  b: String?;
  c: Cell?;
  d: Address?;
  e: Bool?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
  }
}