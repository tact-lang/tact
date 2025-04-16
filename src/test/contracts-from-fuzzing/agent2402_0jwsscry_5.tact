struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Builder?;
  f: Slice?;
  g: String?;
}

contract OptionContract {
  state: ManyOptionals;

  init() {
    self.state = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
    };
  }
}