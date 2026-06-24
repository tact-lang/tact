contract ManyFieldsTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;

  init() {
    self.a = 0;
    self.b = true;
    self.c = "";
    self.d = emptyCell().asSlice();
    self.e = emptyCell();
    self.f = myAddress();
  }
}