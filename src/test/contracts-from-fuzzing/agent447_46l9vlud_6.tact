contract ManyPrimitives {
  int1: Int;
  int2: Int as uint32;
  bool1: Bool;
  bool2: Bool;
  txt1: String;
  txt2: String;
  addr1: Address;
  cell1: Cell;
  sl1: Slice;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;

  init() {
    self.int1 = 1;
    self.int2 = 2;
    self.bool1 = true;
    self.bool2 = false;
    self.txt1 = "a";
    self.txt2 = "b";
    self.addr1 = myAddress();
    self.cell1 = emptyCell();
    self.sl1 = emptyCell().asSlice();
    self.optInt = null;
    self.optBool = null;
    self.optStr = null;
  }
}