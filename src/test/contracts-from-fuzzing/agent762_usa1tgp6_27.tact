contract LongPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Builder;
  h: Int?;
  i: String?;
  j: Address?;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "z";
    self.d = myAddress();
    self.e = emptyCell();
    self.f = self.e.asSlice();
    self.g = beginCell();
    self.h = null;
    self.i = null;
    self.j = null;
  }
}