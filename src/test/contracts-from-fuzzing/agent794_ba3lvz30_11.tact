struct OptionalPrims {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
  g: Builder?;
}

contract OptPrimContract {
  data: OptionalPrims;

  init() {
    self.data = OptionalPrims{
      a: null,
      b: true,
      c: null,
      d: emptyCell(),
      e: null,
      f: "hello",
      g: null
    };
  }
}
