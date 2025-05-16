// array-like pattern: large list of optional Int fields
contract TestContract {
  a0: Int?;
  a1: Int?;
  a2: Int?;
  a3: Int?;
  a4: Int?;
  a5: Int?;
  a6: Int?;
  a7: Int?;
  a8: Int?;
  a9: Int?;

  init() {
    self.a0 = 0;
    self.a1 = 1;
    self.a2 = 2;
    self.a3 = 3;
    self.a4 = 4;
    self.a5 = null;
    self.a6 = null;
    self.a7 = 7;
    self.a8 = null;
    self.a9 = 9;
  }
}