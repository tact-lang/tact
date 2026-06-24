contract ManyBoolDefaults {
  b1: Bool = true;
  b2: Bool = false;
  b3: Bool = true;
  b4: Bool = false;

  init() {
    self.b1 = false;
    self.b2 = true;
  }
}
