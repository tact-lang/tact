contract OptionalDefaultsMix {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Int?;
  e: Bool?;
  f: String?;
  init() {
    self.d = null;
    self.e = null;
    self.f = null;
  }
}