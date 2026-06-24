contract ManyFields3 {
  int1: Int = 1;
  int2: Int = 2;
  bool1: Bool = true;
  bool2: Bool = false;
  addr: Address;
  s1: String = "A";
  s2: String = "B";
  cell1: Cell;
  slice1: Slice;
  opt1: Int? = 3;
  opt2: Address? = null;
  opt3: String? = null;

  init() {
    self.addr = myAddress();
    self.cell1 = emptyCell();
    self.slice1 = emptyCell().asSlice();
  }
}