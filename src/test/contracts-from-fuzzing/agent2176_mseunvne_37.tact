contract ManyMixed {
  x1: Int;
  x2: Bool;
  x3: Int?;
  x4: String;
  x5: Bool?;
  x6: Address;
  x7: Address?;
  x8: Cell;
  x9: Slice;
  x10: Slice?;

  init() {
    self.x1 = 1;
    self.x2 = true;
    self.x3 = null;
    self.x4 = "str";
    self.x5 = false;
    self.x6 = myAddress();
    self.x7 = null;
    self.x8 = emptyCell();
    self.x9 = emptyCell().asSlice();
    self.x10 = null;
  }
}
