contract ManyOptionals {
  a: Int? = null;
  b: Bool? = true;
  c: String? = null;
  d: Address? = null;
  e: Cell;
  f: Slice;

  init() {
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
  }
}