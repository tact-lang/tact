contract OnlyPrimitives {
  i: Int;
  b: Bool;
  s: String;

  init() {
    self.i = 42;
    self.b = true;
    self.s = "hi";
  }
}