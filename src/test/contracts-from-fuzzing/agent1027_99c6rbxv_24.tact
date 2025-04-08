contract InitDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";

  init() {
    self.a = 42;
    self.b = true;
    self.c = "y";
  }
}
