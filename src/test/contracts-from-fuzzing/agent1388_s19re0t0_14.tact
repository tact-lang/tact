contract OptionalDefaultVals {
  a: Int? = null;
  b: Int? = 123;

  init() {
    self.a = null;
    self.b = 456;
  }
}
