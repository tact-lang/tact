// Large flattened contract storage
contract ManyPrimitives {
  a: Int;
  b: Int?;
  c: Bool;
  d: String;
  e: String?;
  f: Int;
  g: Int?;
  h: Bool;
  i: String;
  j: String?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = false;
    self.d = "d";
    self.e = null;
    self.f = 2;
    self.g = null;
    self.h = true;
    self.i = "i";
    self.j = null;
  }
}