contract TestContract {
  intField: Int;
  boolField: Bool;
  cellField: Cell;
  sliceField: Slice;
  stringField: String;
  addressField: Address;

  init() {
    self.intField = 123;
    self.boolField = true;
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.stringField = "Test";
    self.addressField = myAddress();
  }
}