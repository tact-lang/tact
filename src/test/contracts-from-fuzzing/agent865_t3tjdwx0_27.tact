// contract with lots of optional primitive fields
contract MassiveOpts {
  i1: Int?;
  i2: Int?;
  b1: Bool?;
  b2: Bool?;
  s1: String?;
  s2: String?;

  init() {
    self.i1 = null;
    self.i2 = 10;
    self.b1 = true;
    self.b2 = null;
    self.s1 = "hi";
    self.s2 = null;
  }
}
