contract JustPrimitives {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Builder;

  init() {
    self.a = 1;
    self.b = false;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = "hello".asComment().asSlice();
    self.f = "string";
    self.g = beginCell();
  }
}