contract OnlyPrimitives {
  a: Int;
  b: Int?;
  c: Bool;
  d: String;
  e: String?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = true;
    self.d = "str";
    self.e = null;
  }
}