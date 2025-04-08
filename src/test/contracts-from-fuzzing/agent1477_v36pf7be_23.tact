contract OptsAndDefs {
  a: Int?;
  b: Int = 5;
  c: Int?;
  d: Int = 10;

  init() {
    self.a = null;
    self.c = null;
  }
}