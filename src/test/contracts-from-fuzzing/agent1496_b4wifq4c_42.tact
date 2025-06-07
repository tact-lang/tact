contract StringsSliceAddress {
  s: String;
  sl: Slice;
  a: Address;

  init() {
    self.s = "foo";
    self.sl = emptyCell().asSlice();
    self.a = myAddress();
  }
}