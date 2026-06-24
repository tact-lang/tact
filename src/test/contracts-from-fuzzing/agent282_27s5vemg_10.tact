contract ManyBoolOptional {
  a: Bool?;
  b: Bool?;
  c: Bool?;
  d: Bool?;
  e: Bool?;

  init() {
    self.a = true;
    self.b = false;
    self.c = null;
    self.d = true;
    self.e = null;
  }
}