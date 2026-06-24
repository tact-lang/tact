contract MultiplePrimitives {
  intVal: Int;
  boolVal: Bool;
  addrVal: Address;
  strVal: String;
  sl: Slice;
  cl: Cell;
  optInt: Int?;

  init() {
    self.intVal = 5;
    self.boolVal = false;
    self.addrVal = myAddress();
    self.strVal = "abc";
    self.sl = emptyCell().asSlice();
    self.cl = emptyCell();
    self.optInt = null;
  }
}