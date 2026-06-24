contract PrimitivesAndDefaults {
  a: Int = 5;
  b: Bool;
  s: String = "hi";

  init() {
    self.a = 50;
    self.b = true;
    self.s = "hello";
  }
}
