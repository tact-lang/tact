// testing excessive number of optional pritimive fields
contract ManyOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Int?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = 1;
    self.e = true;
    self.f = "hi";
    self.g = null;
    self.h = false;
    self.i = null;
    self.j = 99;
  }
}
