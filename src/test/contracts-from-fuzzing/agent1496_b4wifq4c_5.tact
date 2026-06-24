contract ManyTypes {
  i: Int;
  b: Bool;
  c: Cell;
  sb: Slice;
  s: String;
  a: Address;

  init() {
    self.i = 5;
    self.b = true;
    self.c = emptyCell();
    self.sb = emptyCell().asSlice();
    self.s = "abc";
    self.a = myAddress();
  }
}