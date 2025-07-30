contract TestContract {
  a: Int = 1;
  b: String = "s";
  c: Bool = true;
  d: Cell;
  e: Address;
  f: Slice;
  g: Builder;

  init() {
    self.d = emptyCell();
    self.e = myAddress();
    self.f = emptyCell().asSlice();
    self.g = beginCell();
  }
}