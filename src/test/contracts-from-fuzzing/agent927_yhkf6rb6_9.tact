contract ManyFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Cell;
  f: Slice;
  g: Address;
  h: String;
  i: Cell?;
  j: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = false;
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
    self.g = myAddress();
    self.h = "abc";
    self.i = null;
    self.j = null;
  }
}