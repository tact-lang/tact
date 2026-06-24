// Test optional slice, optional cell, optional address
contract OptionalPrims {
  a: Slice?;
  b: Cell?;
  c: Address?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}
