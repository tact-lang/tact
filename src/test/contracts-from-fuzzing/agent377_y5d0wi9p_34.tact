contract LazyVars {
  a: Int;
  b: Bool;
  c: String;
  d: Cell?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "foo";
    self.d = null;
  }
}