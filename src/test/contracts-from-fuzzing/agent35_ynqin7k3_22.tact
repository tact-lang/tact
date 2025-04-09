contract ManyPrimitives {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  addressVal: Address;
  sliceVal: Slice;
  cellVal: Cell;

  init() {
    self.intVal = 1;
    self.boolVal = true;
    self.stringVal = "a";
    self.addressVal = myAddress();
    self.sliceVal = emptyCell().asSlice();
    self.cellVal = emptyCell();
  }
}