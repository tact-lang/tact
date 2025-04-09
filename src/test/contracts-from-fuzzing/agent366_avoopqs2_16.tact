contract ChainVars {
  a: Int = 1;
  b: Bool = false;
  c: String = "hello";
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int = 42;
  h: Bool = true;
  i: String = "bye";

  init() {
    self.d = null;
    self.e = null;
    self.f = null;
  }
}