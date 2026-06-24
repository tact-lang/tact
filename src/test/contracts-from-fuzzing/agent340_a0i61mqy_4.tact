contract ManyFields {
  a0: Int;
  a1: Int;
  a2: Int;
  a3: Int;
  a4: Int;
  a5: Int;
  a6: Int;
  a7: Int;
  a8: Int;
  a9: Int;
  b0: Bool;
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  s0: String;
  s1: String;
  addr0: Address;
  addr1: Address;
  sl0: Slice;
  sl1: Slice;
  c0: Cell;
  c1: Cell;

  init() {
    self.a0 = 0;
    self.a1 = 1;
    self.a2 = 2;
    self.a3 = 3;
    self.a4 = 4;
    self.a5 = 5;
    self.a6 = 6;
    self.a7 = 7;
    self.a8 = 8;
    self.a9 = 9;
    self.b0 = true;
    self.b1 = false;
    self.b2 = true;
    self.b3 = false;
    self.b4 = true;
    self.s0 = "foo";
    self.s1 = "bar";
    self.addr0 = myAddress();
    self.addr1 = myAddress();
    self.sl0 = emptyCell().asSlice();
    self.sl1 = emptyCell().asSlice();
    self.c0 = emptyCell();
    self.c1 = emptyCell();
  }
}