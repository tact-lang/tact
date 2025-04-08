contract ManyPrimitives {
  a: Int = 0;
  b: Int?;
  c: Bool = false;
  d: Bool?;
  e: Address;
  f: Cell;
  g: Slice;
  h: String;

  init() {
    self.b = null;
    self.d = null;
    self.e = myAddress();
    self.f = emptyCell();
    self.g = emptyCell().asSlice();
    self.h = "hello";
  }
}
