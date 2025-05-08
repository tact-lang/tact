struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Slice?;
  d: Cell?;
  e: Address?;
  f: String?;
}

contract OptionalFields {
  inner: ManyOptionals;

  init() {
    self.inner = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}
