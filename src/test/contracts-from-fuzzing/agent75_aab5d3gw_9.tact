contract Test {
  flag: Bool;
  num: Int;
  text: String;
  data: Cell;
  ref: Slice;
  addr: Address;

  init() {
    self.flag = true;
    self.num = 123;
    self.text = "abc";
    self.data = emptyCell();
    self.ref = emptyCell().asSlice();
    self.addr = myAddress();
  }
}