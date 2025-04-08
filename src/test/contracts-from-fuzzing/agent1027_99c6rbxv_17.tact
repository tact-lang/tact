contract ManyBools {
  b1: Bool = true;
  b2: Bool = false;
  b3: Bool = true;
  b4: Bool = true;
  b5: Bool = false;

  init() {
    self.b2 = true;
    self.b5 = true;
  }
}
