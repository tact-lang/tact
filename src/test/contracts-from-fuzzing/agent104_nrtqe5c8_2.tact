contract ManyPrimitiveFields {
  int1: Int;
  int2: Int;
  bool1: Bool;
  bool2: Bool;
  addr1: Address;
  addr2: Address;
  cell1: Cell;
  cell2: Cell;
  str1: String;
  str2: String;

  init() {
    self.int1 = 1;
    self.int2 = 2;
    self.bool1 = true;
    self.bool2 = false;
    self.addr1 = myAddress();
    self.addr2 = myAddress();
    self.cell1 = emptyCell();
    self.cell2 = emptyCell();
    self.str1 = "hello";
    self.str2 = "world";
  }
}