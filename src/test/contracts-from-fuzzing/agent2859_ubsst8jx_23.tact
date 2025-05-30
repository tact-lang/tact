contract BoolDefaults {
  b1: Bool = true;
  b2: Bool = false;
  b3: Bool = true;

  init() {
    self.b1 = false;
    self.b2 = true;
    self.b3 = false;
  }
}