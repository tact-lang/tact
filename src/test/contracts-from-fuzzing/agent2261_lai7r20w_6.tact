contract FlattenWide {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
  e: Bool = true;
  f: Bool = false;
  g: Int as int8 = 8;
  h: Int as uint16 = 16;
  i: Bool = false;
  j: Int = 10;

  init() {
    self.a = 11;
    self.b = 12;
    self.c = 13;
    self.d = 14;
    self.e = false;
    self.f = true;
    self.g = -8;
    self.h = 16000;
    self.i = true;
    self.j = 100;
  }
}