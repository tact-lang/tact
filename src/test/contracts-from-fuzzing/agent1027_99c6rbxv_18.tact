struct Complex {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Builder;
}
contract ComplexPersist {
  val: Complex;
  init() {
    self.val = Complex{
      a:1,
      b:true,
      c:"Hi",
      d:emptyCell(),
      e:emptyCell().asSlice(),
      f:myAddress(),
      g:beginCell()
    };
  }
}
