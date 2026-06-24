contract ComplexOptionalMix {
  foo: Int?;
  bar: Bool;
  baz: String?;
  addr: Address?;
  cell: Cell;
  sl: Slice?;

  init() {
    self.foo=null;self.bar=true;self.baz=null;self.addr=null;self.cell=emptyCell();self.sl=null;
  }
}