contract MultiOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Bool?;
  g: Bool?;
  h: Bool?;

  init() {
    self.a = null;
    self.b = 1;
    self.c = 2;
    self.d = null;
    self.e = 3;
    self.f = true;
    self.g = null;
    self.h = false;
  }
}