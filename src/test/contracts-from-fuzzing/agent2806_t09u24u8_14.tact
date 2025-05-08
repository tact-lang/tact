contract ManyOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: String?;
  f: String?;
  g: Bool?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = 3;
    self.d = null;
    self.e = "e";
    self.f = null;
    self.g = true;
  }
}