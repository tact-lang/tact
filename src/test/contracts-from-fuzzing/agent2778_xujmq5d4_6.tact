struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Address?;
  f: Cell?;
  g: Slice?;
  h: Builder?;
}

contract ManyOptionalsContract {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      a: null, b: null, c: null, d: null,
      e: null, f: null, g: null, h: null
    };
  }
}
