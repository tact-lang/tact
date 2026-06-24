contract MixedPrimitives {
  i: Int;
  b: Bool;
  a: Address;
  c: Cell;
  s: String;
  sl: Slice;

  init() {
    self.i = 1;
    self.b = true;
    self.a = myAddress();
    self.c = emptyCell();
    self.s = "test";
    self.sl = emptyCell().asSlice();
  }
}