contract BigFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
  h: Bool?;
  i: Int?;
  j: String?;
  k: Cell;
  l: Slice;
  m: Builder;
  n: Address;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "hi";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = beginCell();
    self.g = myAddress();
    self.h = null;
    self.i = null;
    self.j = "yo";
    self.k = emptyCell();
    self.l = emptyCell().asSlice();
    self.m = beginCell();
    self.n = myAddress();
  }
}