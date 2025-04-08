contract Variety {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  bu: Builder;
  addr: Address;

  init() {
    self.i = 10;
    self.b = true;
    self.s = "x";
    self.c = emptyCell();
    self.sl = emptyCell().asSlice();
    self.bu = beginCell();
    self.addr = myAddress();
  }
}