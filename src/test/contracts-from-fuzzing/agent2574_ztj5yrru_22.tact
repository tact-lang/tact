contract OptionalSwap {
  a: Int? = null;
  b: Int? = 10;

  init() {
    self.a = 33;
    self.b = null;
  }
}