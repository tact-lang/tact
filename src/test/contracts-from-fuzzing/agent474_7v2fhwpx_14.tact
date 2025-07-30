contract Test {
  intVal: Int = 6;
  optInt: Int? = null;
  strVal: String = "hi";
  optStr: String? = null;
  boolVal: Bool = true;
  optBool: Bool? = true;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;

  init() {
    self.intVal = 8;
    self.optInt = null;
    self.strVal = "x";
    self.optStr = null;
    self.boolVal = false;
    self.optBool = null;
    self.addrVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
  }
}
