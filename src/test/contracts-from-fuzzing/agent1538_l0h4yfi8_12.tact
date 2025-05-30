contract ManyPrimitives {
  a: Int;
  b: Bool;
  c: Bool?;
  d: String;
  e: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = "abc";
    self.e = null;
  }
}