// Contract with many primitive persistent fields, no init defaults
contract PlainPrimitives {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = "hello";
  }
}
