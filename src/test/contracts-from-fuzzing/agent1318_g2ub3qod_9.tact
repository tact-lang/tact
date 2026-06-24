contract TestContract {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: Cell;
  h: Cell?;
  i: Builder;
  j: Builder?;
  k: Slice;
  l: Slice?;
  m: String;
  n: String?;
  o: Int;

  init() {
    self.a = 1;
    self.b = null;
    self.c = true;
    self.d = false;
    self.e = myAddress();
    self.f = null;
    self.g = emptyCell();
    self.h = null;
    self.i = beginCell();
    self.j = null;
    self.k = emptyCell().asSlice();
    self.l = null;
    self.m = "hi";
    self.n = null;
    self.o = 42;
  }
}