contract PrimitiveDefaults {
  i1: Int = 5;
  b1: Bool = true;
  s1: String = "s";

  init() {
    self.i1 = 42;
    self.b1 = false;
    self.s1 = "abc";
  }
}