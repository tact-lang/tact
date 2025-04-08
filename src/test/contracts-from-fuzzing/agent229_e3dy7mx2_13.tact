struct WithManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Builder?;
  g: Address?;
}

contract LargeOptionalMix {
  s: WithManyOptionals;

  init() {
    self.s = WithManyOptionals{
      a: null,
      b: true,
      c: null,
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: null
    };
  }
}
