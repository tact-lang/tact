contract OnlyPrimitives {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";

  init() {
    self.a = 42;
    self.b = false;
    self.c = "hello";
  }
}