contract TestContract {
  i32: Int as uint32;
  ui4: Int as uint4;
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  addr: Address;

  init() {
    self.i32 = 123;
    self.ui4 = 5;
    self.i = -1;
    self.b = true;
    self.s = "abc";
    self.c = emptyCell();
    self.sl = emptyCell().asSlice();
    self.addr = myAddress();
  }
}