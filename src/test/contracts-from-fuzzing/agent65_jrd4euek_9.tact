contract MixedPersistent {
  intField: Int;
  boolField: Bool;
  stringField: String;
  cellField: Cell;
  sliceField: Slice;
  builderField: Builder;
  addressField: Address;

  init() {
    self.intField = 42;
    self.boolField = true;
    self.stringField = "Hello";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.builderField = beginCell();
    self.addressField = myAddress();
  }
}