contract LongPrimitives {
  a: Int;
  b: Bool;
  c: Cell;
  d: Slice;
  e: Address;
  f: String;

  init() {
    self.a = 10;
    self.b = true;
    self.c = emptyCell();
    self.d = emptyCell().asSlice();
    self.e = myAddress();
    self.f = "test";
  }
}