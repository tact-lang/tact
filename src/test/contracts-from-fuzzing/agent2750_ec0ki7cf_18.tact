contract SimpleMix {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addrVal: Address;
  sl: Slice;
  cl: Cell;
  optInt: Int?;
  optStr: String?;

  init() {
    self.intVal = 42;
    self.boolVal = true;
    self.strVal = "hello";
    self.addrVal = myAddress();
    self.sl = emptyCell().asSlice();
    self.cl = emptyCell();
    self.optInt = null;
    self.optStr = null;
  }
}
