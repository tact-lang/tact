struct SOptionals {
  a: Int?;
  b: Bool?;
  c: Cell?;
  d: Slice?;
  e: String?;
  f: Address?;
}

contract OptionalStorage {
  data: SOptionals;

  init() {
    self.data = SOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
    };
  }
}
