contract MixDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "s";
  d: Cell;
  e: Slice;
  f: Address;

  init() {
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = myAddress();
  }
}