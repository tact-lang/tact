contract LargeOptionalMix {
  a: Int? = null;
  b: String? = null;
  c: Int? = null;
  d: String? = null;
  e: Bool? = null;
  f: Bool? = null;

  init() {
    self.a = 1;
    self.b = "a";
    self.c = 2;
    self.d = "b";
    self.e = true;
    self.f = false;
  }
}