contract Test {
  a: Int = 0;
  b: Bool = false;
  c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
  d: Cell; // leave uninitialized
  e: Slice; // leave uninitialized
  f: String = "hi";

  init() {
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
  }
}