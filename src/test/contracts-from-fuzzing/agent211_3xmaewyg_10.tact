contract AllPrimitiveTypes {
  intField: Int;
  boolField: Bool;
  addressField: Address;
  cellField: Cell;
  sliceField: Slice;
  stringField: String;

  init() {
    self.intField = 42;
    self.boolField = true;
    self.addressField = myAddress();
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.stringField = "hi";
  }
}
