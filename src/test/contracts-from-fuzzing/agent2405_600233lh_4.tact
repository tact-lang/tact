contract LargePrimitives {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: Builder;
  g: String;
  h: Int?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = beginCell();
    self.g = "hello";
    self.h = null;
  }
}