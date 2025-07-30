contract ChainDefaults {
  a: Int = 7;
  b: Bool = true;
  c: String = "foo";
  d: Int? = null;
  e: Bool? = null;

  init() {
    self.a = 10;
    self.b = false;
    self.c = "bar";
    self.d = null;
    self.e = true;
  }
}