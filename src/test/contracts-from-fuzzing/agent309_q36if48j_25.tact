contract ComplexTypes {
  a: Address;
  b: Cell;
  c: Slice;
  d: String;

  init() {
    self.a = myAddress();
    self.b = emptyCell();
    self.c = emptyCell().asSlice();
    self.d = "hello";
  }
}