contract StringsWithDefaults {
  s1: String = "hello";
  s2: String = "world";

  init() {
    self.s1 = "foo";
    self.s2 = "bar";
  }
}