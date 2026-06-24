contract Primitives {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
  bl: Builder;

  init() {
    self.i=1;
    self.b=true;
    self.s="s";
    self.a=myAddress();
    self.c=emptyCell();
    self.sl=emptyCell().asSlice();
    self.bl=beginCell();
  }
}
