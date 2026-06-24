contract ManyDirectFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;

  init() {
    self.d = null;
    self.e = null;
    self.f = null;
    self.a = 1;
    self.b = true;
    self.c = "hi";
    self.g = 2;
    self.h = false;
    self.i = "world";
  }
}