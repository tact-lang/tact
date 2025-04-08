contract DeepOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Int?;
  f: Bool?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = null;
    self.e = 123;
    self.f = false;
  }
}