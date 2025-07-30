contract WideFlatInit {
  a: Int = 1;
  b: Int = 2;
  c: String = "c";
  d: String = "d";
  e: Bool = true;
  f: Bool = false;
  g: Address;
  h: Cell;
  i: Cell;
  j: Slice;
  k: Slice;

  init() {
    self.g = myAddress();
    self.h = emptyCell();
    self.i = emptyCell();
    self.j = emptyCell().asSlice();
    self.k = emptyCell().asSlice();
  }
}
