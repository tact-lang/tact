contract TestContract {
  s: Slice? = null;

  init() {
    self.s = emptyCell().asSlice();
  }
}
