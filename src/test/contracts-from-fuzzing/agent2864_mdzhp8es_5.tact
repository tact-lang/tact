contract ManyPrimitives {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  optInt: Int?;

  init() {
    self.intVal = 123;
    self.boolVal = false;
    self.strVal = "hi";
    self.addrVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.optInt = null;
  }
}