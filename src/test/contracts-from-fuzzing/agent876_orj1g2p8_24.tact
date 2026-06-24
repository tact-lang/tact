contract LargeOptionalPrimitives {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Bool?;
  f: Bool?;
  g: String?;
  h: String?;

  init() {
    self.a = null;
    self.b = 2;
    self.c = null;
    self.d = 4;
    self.e = true;
    self.f = null;
    self.g = "hello";
    self.h = null;
  }
}