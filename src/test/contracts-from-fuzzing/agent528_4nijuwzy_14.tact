contract SparseDefaults {
  a: Int;
  b: Int = 1;
  c: Bool;
  d: Bool = false;

  init() {
    self.a = 42;
    self.c = true;
  }
}
