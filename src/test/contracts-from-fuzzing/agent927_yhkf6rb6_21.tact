contract CrossTypes {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;

  init() {
    self.intVal = 5;
    self.boolVal = false;
    self.strVal = "hi";
    self.addrVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
  }
}