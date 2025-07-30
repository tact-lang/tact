contract Test {
  x1: Int = 1;
  x2: Bool = true;
  x3: String = "abc";
  x4: Slice;

  init() {
    self.x4 = emptyCell().asSlice();
  }
}
