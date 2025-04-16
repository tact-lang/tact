contract Test {
  addr: Address;
  str: String;
  sl: Slice;

  init() {
    self.addr = myAddress();
    self.str = "hello";
    self.sl = emptyCell().asSlice();
  }
}
