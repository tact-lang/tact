contract MultipleOptionalBits {
  b1: Bool?;
  b2: Bool?;
  b3: Bool?;
  b4: Bool?;
  b5: Bool?;

  init() {
    self.b1 = null;
    self.b2 = true;
    self.b3 = false;
    self.b4 = null;
    self.b5 = true;
  }
}