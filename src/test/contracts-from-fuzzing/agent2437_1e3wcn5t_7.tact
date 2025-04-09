struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Builder?;
  g: Address?;
}

contract ManyOptionalsContract {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
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