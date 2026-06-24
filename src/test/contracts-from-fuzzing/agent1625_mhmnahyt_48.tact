contract OptionalStringAndDefault {
  s: String? = null;
  i: Int = 42;

  init() {
    self.s = null;
    self.i = 100;
  }
}
