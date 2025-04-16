contract ManyOptionals {
  a: Int?;
  b: Int?;
  c: String?;
  d: String?;
  e: Bool?;
  f: Bool?;

  init() {
    self.a = null;
    self.b = 42;
    self.c = null;
    self.d = "abc";
    self.e = null;
    self.f = true;
  }
}