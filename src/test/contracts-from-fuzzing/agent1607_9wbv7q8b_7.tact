contract ManyVars {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
  f: Bool;
  g: Int;
  h: Bool;
  i: Address;
  j: Cell;
  k: Slice;

  init() {
    self.a = 1;
    self.b = true;
    self.c = 2;
    self.d = false;
    self.e = 3;
    self.f = true;
    self.g = 4;
    self.h = false;
    self.i = myAddress();
    self.j = emptyCell();
    self.k = emptyCell().asSlice();
  }
}
