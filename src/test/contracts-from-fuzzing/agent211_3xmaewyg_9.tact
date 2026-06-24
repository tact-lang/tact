contract ManyOptionalInts {
  oi1: Int?;
  oi2: Int?;
  oi3: Int?;
  oi4: Int?;
  oi5: Int?;

  init() {
    self.oi1 = 1;
    self.oi2 = null;
    self.oi3 = 3;
    self.oi4 = null;
    self.oi5 = 5;
  }
}
