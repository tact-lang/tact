contract ManyTyping {
  intField: Int;
  boolField: Bool;
  strField: String;
  addrField: Address;
  cellField: Cell;
  sliceField: Slice;
  
  init() {
    self.intField = 42;
    self.boolField = true;
    self.strField = "hi";
    self.addrField = myAddress();
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
  }
}
