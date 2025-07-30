contract Defaults {
  a: Int = 10;
  b: Bool = true;
  c: String = "def";
  d: Cell;
  e: Slice;
  f: Builder;

  init() {
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = beginCell();
  }
}