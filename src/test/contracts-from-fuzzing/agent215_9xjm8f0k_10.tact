contract MultiTypes {
  a: Int = 1;
  b: Bool = true;
  c: String = "test";
  d: Address? = null;
  e: Cell;
  f: Slice;

  init() {
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
  }
}