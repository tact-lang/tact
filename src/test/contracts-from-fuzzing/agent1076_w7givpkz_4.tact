contract ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int;
  h: Bool;
  i: String;
  j: Address;
  k: Cell;
  l: Slice;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "a";
    self.d = myAddress();
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
    self.g = 2;
    self.h = false;
    self.i = "b";
    self.j = myAddress();
    self.k = emptyCell();
    self.l = emptyCell().asSlice();
  }
}
