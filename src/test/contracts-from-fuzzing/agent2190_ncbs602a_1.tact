contract LargeFieldContract {
  a: Int;
  b: Int;
  c: Bool;
  d: Bool;
  e: Int?;
  f: String;
  g: String?;
  h: Cell;
  i: Slice;
  j: Address;
  k: Int;
  l: Bool;
  m: String;
  n: Address;
  o: Slice;
  p: Cell;
  q: Bool?;
  r: Int?;
  s: String?;
  t: Address;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = true;
    self.d = false;
    self.e = null;
    self.f = "f";
    self.g = null;
    self.h = emptyCell();
    self.i = emptyCell().asSlice();
    self.j = myAddress();
    self.k = 123;
    self.l = true;
    self.m = "hello";
    self.n = myAddress();
    self.o = emptyCell().asSlice();
    self.p = emptyCell();
    self.q = null;
    self.r = null;
    self.s = null;
    self.t = myAddress();
  }
}