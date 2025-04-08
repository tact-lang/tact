contract SparseOptionals {
  a: Int?;
  b: Int = 1;
  c: Int?;
  d: Bool = false;
  e: Bool?;
  f: Bool = true;

  init() {
    self.a = null;
    self.c = null;
    self.e = null;
  }
}
