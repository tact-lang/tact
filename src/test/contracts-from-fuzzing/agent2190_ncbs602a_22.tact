contract SparseOptionals {
  a: Int?;
  b: Bool;
  c: String?;
  d: Int;
  e: Bool?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = 42;
    self.e = null;
  }
}