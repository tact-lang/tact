contract OptionalTopLevel {
  a: Int?;
  b: String?;
  c: Address?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = null;
  }
}