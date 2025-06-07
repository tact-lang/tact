// Large contract with many persistent optional primitive fields
contract ManyOptionalPrimitives {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Bool?;
  h: Bool?;
  i: Bool?;
  j: Bool?;
  k: String?;
  l: String?;
  m: String?;
  n: String?;

  init() {
    self.a = null; self.b = null; self.c = null; self.d = null;
    self.e = null; self.f = null; self.g = null; self.h = null;
    self.i = null; self.j = null; self.k = null; self.l = null;
    self.m = null; self.n = null;
  }
}