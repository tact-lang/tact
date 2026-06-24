contract LargePrimitiveSet {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;

  init() {
    self.a = 17;
    self.b = false;
    self.c = "hello";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = myAddress();
  }
}