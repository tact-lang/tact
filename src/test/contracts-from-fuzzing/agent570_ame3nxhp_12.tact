contract Test {
  a: Int = 0;
  b: Int as uint32 = 1;
  c: Bool = true;
  d: Bool? = null;
  e: Int? = null;

  init() {
    self.a = 42;
    self.b = 2;
    self.c = false;
    self.d = true;
    self.e = 100;
  }
}