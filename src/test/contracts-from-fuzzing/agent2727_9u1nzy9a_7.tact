contract ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;
  g: Int;
  h: Bool;
  i: String;
  j: Slice;
  k: Cell;
  l: Address;
  m: Int;
  n: Bool;
  o: String;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "c";
    self.d = emptyCell().asSlice();
    self.e = emptyCell();
    self.f = myAddress();
    self.g = 2;
    self.h = true;
    self.i = "i";
    self.j = emptyCell().asSlice();
    self.k = emptyCell();
    self.l = myAddress();
    self.m = 3;
    self.n = false;
    self.o = "o";
  }
}