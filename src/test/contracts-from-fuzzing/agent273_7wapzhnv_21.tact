contract InitDefaults {
  a: Int = 10;
  b: Bool = true;
  c: Int? = null;
  d: Bool? = false;
  e: String = "test";

  init() {
    self.a = 20;
    self.b = false;
    self.c = 30;
    self.d = null;
    self.e = "changed";
  }
}