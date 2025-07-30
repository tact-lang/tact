contract MixedFields {
  intField: Int;
  boolField: Bool;
  stringField: String;
  optionalInt: Int?;
  optionalBool: Bool?;
  optionalString: String?;
  cellField: Cell;
  sliceField: Slice;
  addressField: Address;

  init() {
    self.intField = 10;
    self.boolField = true;
    self.stringField = "test";
    self.optionalInt = 7;
    self.optionalBool = false;
    self.optionalString = "opt";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.addressField = myAddress();
  }
}
