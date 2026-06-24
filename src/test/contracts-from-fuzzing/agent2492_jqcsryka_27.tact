contract OnlyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;

  init() {
    self.a = 555;
    self.b = false;
    self.c = "test";
    self.d = null;
  }
}