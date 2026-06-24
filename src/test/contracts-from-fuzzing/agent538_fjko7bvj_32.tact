contract LargeContract {
  x1: Int = 1;
  x2: Bool = false;
  x3: Int?;
  x4: String = "x";
  x5: Address;
  x6: Cell;
  x7: Slice;

  init() {
    self.x1 = 11;
    self.x2 = true;
    self.x3 = null;
    self.x4 = "xx";
    self.x5 = myAddress();
    self.x6 = emptyCell();
    self.x7 = emptyCell().asSlice();
  }
}
