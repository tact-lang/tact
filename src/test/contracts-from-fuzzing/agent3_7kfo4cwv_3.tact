contract ManyFields {
  a: Int;
  b: Bool;
  c: Cell;
  d: Slice;
  e: Address;
  f: Int;
  g: Bool;
  h: Cell;
  i: Slice;
  j: Address;
  k: Int;
  l: Bool;
  m: Cell;
  n: Slice;
  o: String;

  init() {
    self.a = 1;
    self.b = true;
    self.c = emptyCell();
    self.d = emptyCell().asSlice();
    self.e = myAddress();
    self.f = 2;
    self.g = false;
    self.h = emptyCell();
    self.i = emptyCell().asSlice();
    self.j = myAddress();
    self.k = 3;
    self.l = true;
    self.m = emptyCell();
    self.n = emptyCell().asSlice();
    self.o = "test";
  }

  receive() {}
}