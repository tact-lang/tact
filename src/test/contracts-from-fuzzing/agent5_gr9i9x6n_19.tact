contract AllOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Slice?;
  f: Cell?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
  }

  receive() {
    if (self.f != null) {
      let _ = self.f!!;
    }
  }
}
