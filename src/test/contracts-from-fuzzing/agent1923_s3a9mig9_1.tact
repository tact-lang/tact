contract ManyTypesStorage {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addressVal: Address;
  cellVal: Cell;
  builderVal: Builder;
  sliceVal: Slice;
  optionalInt: Int?;
  optionalBool: Bool?;

  init() {
    self.intVal = 7;
    self.boolVal = true;
    self.strVal = "hi";
    self.addressVal = myAddress();
    self.cellVal = emptyCell();
    self.builderVal = beginCell();
    self.sliceVal = emptyCell().asSlice();
    self.optionalInt = null;
    self.optionalBool = true;
  }
}