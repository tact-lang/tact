contract TestContract {
  a: Int = 1;
  b: Bool = true;
  c: Int?;
  d: String?;
  e: Bool?;
  f: Address;
  g: Slice;
  h: Cell;

  init() {
    self.c = null;
    self.d = null;
    self.e = true;
    self.f = myAddress();
    self.g = emptyCell().asSlice();
    self.h = emptyCell();
  }
}