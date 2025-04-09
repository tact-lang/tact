contract ManyPrimitiveFields {
  i1: Int;
  i2: Int;
  b1: Bool;
  b2: Bool;
  s1: String;
  s2: String;
  a1: Address;
  c1: Cell;
  sl1: Slice;
  bd1: Builder;

  init() {
    self.i1 = 1;
    self.i2 = 2;
    self.b1 = true;
    self.b2 = false;
    self.s1 = "foo";
    self.s2 = "bar";
    self.a1 = myAddress();
    self.c1 = emptyCell();
    self.sl1 = emptyCell().asSlice();
    self.bd1 = beginCell();
  }
}
