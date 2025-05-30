contract FieldOrdering {
  a: Int as uint8;
  b: Int;
  c: Int as uint256;

  init() {
    self.a = 5;
    self.b = 42;
    self.c = 256;
  }
}