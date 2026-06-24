contract BigMix {
  a: Int;
  b: Bool?;
  c: Slice;
  d: Slice?;
  e: Cell;
  f: Cell?;
  g: Builder;
  h: Builder?;
  i: Address;
  j: Address?;
  k: String;
  l: String?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = emptyCell().asSlice();
    self.d = null;
    self.e = emptyCell();
    self.f = null;
    self.g = beginCell();
    self.h = null;
    self.i = myAddress();
    self.j = null;
    self.k = "hi";
    self.l = null;
  }
}