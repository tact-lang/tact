contract ManyPrimitiveFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Builder;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "abc";
    self.d = myAddress();
    self.e = emptyCell();
    self.f = self.e.asSlice();
    self.g = beginCell();
  }
}