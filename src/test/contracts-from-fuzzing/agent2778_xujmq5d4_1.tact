contract ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Slice;
  g: Builder;
  h: Int?;
  i: Bool?;
  j: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "abc";
    self.d = emptyCell();
    self.e = myAddress();
    self.f = emptyCell().asSlice();
    self.g = beginCell();
    self.h = null;
    self.i = null;
    self.j = null;
  }
}
