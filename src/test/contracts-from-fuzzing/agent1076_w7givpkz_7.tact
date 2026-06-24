contract ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;

  init() {
    self.a = 3;
    self.b = null;
    self.c = null;
    self.d = myAddress();
    self.e = null;
    self.f = null;
  }
}
