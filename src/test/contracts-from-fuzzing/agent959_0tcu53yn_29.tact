contract OnlyFields {
  a: Int;
  b: Int?;
  c: String;
  d: Cell;
  e: Slice;
  f: Bool;
  g: Address;
  h: String?;
  i: Address?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = "str";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = false;
    self.g = myAddress();
    self.h = null;
    self.i = null;
  }
}