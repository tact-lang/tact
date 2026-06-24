contract LargeFieldList {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int;
  h: Bool;
  i: String;
  j: Cell;
  k: Slice;
  l: Address;
  m: Int;
  n: Bool;
  o: String;
  p: Cell;
  q: Slice;
  r: Address;
  s: Int;
  t: Bool;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "a";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = myAddress();
    self.g = 2;
    self.h = false;
    self.i = "b";
    self.j = emptyCell();
    self.k = emptyCell().asSlice();
    self.l = myAddress();
    self.m = 3;
    self.n = true;
    self.o = "c";
    self.p = emptyCell();
    self.q = emptyCell().asSlice();
    self.r = myAddress();
    self.s = 4;
    self.t = false;
  }
}