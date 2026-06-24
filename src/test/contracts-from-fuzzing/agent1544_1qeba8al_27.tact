contract BoolOptionalDefault {
  b1: Bool? = true;
  b2: Bool? = null;

  init() {
    self.b1 = null;
    self.b2 = true;
  }
}
