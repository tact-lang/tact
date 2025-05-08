contract Test {
  a: Int;
  b: Bool;
  c: String?;
  d: Cell;
  e: Address;
  f: Slice;
  g: Bool?;
  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = emptyCell();
    self.e = myAddress();
    self.f = emptyCell().asSlice();
    self.g = false;
  }
}