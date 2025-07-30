contract ManyOptional {
  a: Int?;
  b: String?;
  c: Cell?;
  d: Slice?;
  e: Address?;
  f: Bool?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
  }
}
