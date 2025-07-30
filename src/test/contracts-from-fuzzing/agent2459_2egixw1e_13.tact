contract TestContract {
  i: Int;
  ni: Int as int64;
  ui: Int as uint64;
  flag: Bool;
  txt: String;
  addr: Address;
  cellVal: Cell;
  sliceVal: Slice;
  optI: Int?;
  optStr: String?;
  optAddr: Address?;
  optCell: Cell?;
  optSlice: Slice?;

  init() {
    self.i = 1;
    self.ni = -2;
    self.ui = 42;
    self.flag = true;
    self.txt = "x";
    self.addr = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.optI = null;
    self.optStr = null;
    self.optAddr = null;
    self.optCell = null;
    self.optSlice = null;
  }
}