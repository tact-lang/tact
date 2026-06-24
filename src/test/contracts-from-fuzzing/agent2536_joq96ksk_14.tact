// many fields with all optional and some default nulls
contract ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Bool?;
  d: String?;
  e: String?;
  f: Address?;
  g: Slice?;
  h: Builder?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = null;
    self.h = null;
  }
}