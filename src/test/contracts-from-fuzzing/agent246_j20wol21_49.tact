contract OptDefault {
  a: Int? = null;
  b: Int? = 5;

  init() {
    self.b = null;
  }
}