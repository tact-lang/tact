contract BigMix {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
  g: Cell;
  h: Slice;
  i: Address;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = null;
    self.e = "abc";
    self.f = null;
    self.g = emptyCell();
    self.h = emptyCell().asSlice();
    self.i = myAddress();
  }
}