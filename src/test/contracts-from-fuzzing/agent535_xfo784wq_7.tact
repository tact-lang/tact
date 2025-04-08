contract ManyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Address?;
  e: Cell;
  f: Slice;
  g: Builder;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "hi";
    self.d = null;
    self.e = emptyCell();
    self.f = emptySlice();
    self.g = beginCell();
  }
}