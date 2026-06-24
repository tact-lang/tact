contract OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;
  d: Cell? = null;
  e: Slice? = null;

  init() {
    self.a = 1;
    self.b = false;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
  }
}