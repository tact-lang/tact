contract ManyMixedFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
  g: Builder;
  h: Cell;
  i: Slice;
  j: Address;

  init() {
    self.a = 1;
    self.b = false;
    self.c = null;
    self.d = null;
    self.e = "hello";
    self.f = null;
    self.g = beginCell();
    self.h = emptyCell();
    self.i = self.h.asSlice();
    self.j = myAddress();
  }
}