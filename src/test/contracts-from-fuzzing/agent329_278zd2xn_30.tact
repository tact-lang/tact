contract TestContract {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int as uint8;
  h: Int as int64;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "a";
    self.d = null;
    self.e = false;
    self.f = null;
    self.g = 3;
    self.h = -99;
  }
}