contract MultiplePrimitiveTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  addr: Address;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "str";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.addr = myAddress();
  }
}