contract MultiTypeFields {
  a: Int;
  b: Bool;
  c: Cell;
  d: Slice;
  e: String;
  f: Address;

  init() {
    self.a = 1;
    self.b = false;
    self.c = emptyCell();
    self.d = emptyCell().asSlice();
    self.e = "abc";
    self.f = myAddress();
  }
}
