contract MultiTypeFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;

  init() {
    self.a=1;
    self.b=true;
    self.c="c";
    self.d=myAddress();
    self.e=emptyCell();
    self.f=emptyCell().asSlice();
  }
}