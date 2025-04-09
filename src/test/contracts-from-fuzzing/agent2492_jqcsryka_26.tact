contract ManySeparateFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "x";
    self.d = null;
    self.e = false;
  }
}