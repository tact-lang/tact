contract TestContract {
  a: Int = 1;
  b: Bool = true;
  c: Int? = null;
  d: Bool? = null;
  e: Int = 5;
  f: Bool = false;
  g: Int? = null;
  h: Bool? = true;

  init() {
    self.a = 2;
    self.b = false;
    self.c = 3;
    self.d = null;
    self.e = 6;
    self.f = true;
    self.g = null;
    self.h = false;
  }
}