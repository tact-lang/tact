contract CrossTypes {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;

  init() {
    self.a = -123;
    self.b = true;
    self.c = null;
    self.d = false;
    self.e = "test";
    self.f = null;
  }
}