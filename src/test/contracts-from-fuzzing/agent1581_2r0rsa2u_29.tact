contract OnlyDefaultsPartial {
  a: Int = 1;
  b: Bool;
  c: String = "foo";

  init() {
    self.b = false;
  }
}