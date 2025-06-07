contract TonsOfPrimitives {
  int1: Int;
  int2: Int as uint8;
  int3: Int as int16;
  bool1: Bool;
  bool2: Bool;
  slice1: Slice;
  slice2: Slice;
  cell1: Cell;
  cell2: Cell;
  addr1: Address;
  addr2: Address;
  str1: String;
  str2: String;

  init() {
    self.int1 = 1;
    self.int2 = 2;
    self.int3 = -3;
    self.bool1 = true;
    self.bool2 = false;
    self.slice1 = emptyCell().asSlice();
    self.slice2 = emptyCell().asSlice();
    self.cell1 = emptyCell();
    self.cell2 = emptyCell();
    self.addr1 = myAddress();
    self.addr2 = myAddress();
    self.str1 = "abc";
    self.str2 = "def";
  }

  receive() {
    let _ = self.int3;
  }
}
