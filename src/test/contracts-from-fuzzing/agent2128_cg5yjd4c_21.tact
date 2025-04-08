contract WidePrimitives {
  intVal: Int;
  boolVal: Bool;
  sliceVal: Slice;
  addrVal: Address;
  stringVal: String;
  cellVal: Cell;

  init() {
    self.intVal = 1;
    self.boolVal = true;
    self.sliceVal = emptyCell().asSlice();
    self.addrVal = myAddress();
    self.stringVal = "xyz";
    self.cellVal = emptyCell();
  }
}