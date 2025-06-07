contract TypesMix {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: Builder;
  g: String;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = self.d.asSlice();
    self.f = beginCell();
    self.g = "hi";
  }
}
