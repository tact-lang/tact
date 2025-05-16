contract OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Cell? = null;
  e: Slice? = null;
  f: Address? = null;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
  }
}