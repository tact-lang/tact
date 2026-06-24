contract PersistMany {
  int1: Int;
  int2: Int;
  bool1: Bool;
  bool2: Bool;
  addr: Address;
  cell1: Cell;
  slice1: Slice;
  str1: String;

  init() {
    self.int1 = 1;
    self.int2 = 2;
    self.bool1 = true;
    self.bool2 = false;
    self.addr = myAddress();
    self.cell1 = emptyCell();
    self.slice1 = emptyCell().asSlice();
    self.str1 = "hello";
  }
}