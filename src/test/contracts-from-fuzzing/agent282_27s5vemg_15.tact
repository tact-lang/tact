contract LargeMixed {
  i1: Int;
  b1: Bool;
  s1: String;
  addr1: Address;
  sl1: Slice;
  bl1: Builder;
  c1: Cell;

  i2: Int?;
  b2: Bool?;
  s2: String?;
  addr2: Address?;
  sl2: Slice?;
  bl2: Builder?;
  c2: Cell?;

  init() {
    self.i1 = 1;
    self.b1 = false;
    self.s1 = "hi";
    self.addr1 = myAddress();
    self.sl1 = emptyCell().asSlice();
    self.bl1 = beginCell();
    self.c1 = emptyCell();

    self.i2 = null;
    self.b2 = null;
    self.s2 = null;
    self.addr2 = null;
    self.sl2 = null;
    self.bl2 = null;
    self.c2 = null;
  }
}