struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
}

contract OptionalVariety {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      a: null,
      b: true,
      c: null,
      d: null,
      e: emptyCell(),
    };
  }
}