contract Multitype {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  init() {
    self.a = 1;
    self.b = false;
    self.c = "abc";
    self.d = myAddress();
    self.e = emptyCell();
  }
}