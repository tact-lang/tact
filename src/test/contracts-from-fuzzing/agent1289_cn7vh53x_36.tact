// test optional Address, Cell, and Slice serialization
contract OptPrimitives {
  a: Address?;
  b: Cell?;
  c: Slice?;

  init() {
    self.a=null; self.b=null; self.c=null;
  }
}
