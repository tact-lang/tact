contract MultipleDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Bool = true;
  e: String = "foo";

  init() {
    self.a = 11;
    self.b = 22;
    self.c = 33;
    self.d = false;
    self.e = "bar";
  }
}