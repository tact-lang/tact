contract PrimitivesPlusStrings {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  addr: Address;

  init() {
    self.i=1;
    self.b=true;
    self.s="x";
    self.c=emptyCell();
    self.addr=myAddress();
  }
}