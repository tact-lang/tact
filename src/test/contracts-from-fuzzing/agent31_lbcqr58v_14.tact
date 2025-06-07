// Contract with a large persistent tuple of primitive fields
contract Test {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
  e: Int;
  f: Int?;
  g: Int;
  h: Int?;
  i: Int;
  j: Int?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = 2;
    self.d = null;
    self.e = 3;
    self.f = null;
    self.g = 4;
    self.h = null;
    self.i = 5;
    self.j = null;
  }
}