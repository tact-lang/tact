struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Slice?;
  f: Cell?;
}

contract OptionalFields {
  opt: ManyOptionals;

  init() {
    self.opt = ManyOptionals{
      a: null,
      b: true,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}