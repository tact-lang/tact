struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: String?;
}

contract LotsOfOptionals {
  opts: ManyOptionals;

  init() {
    self.opts = ManyOptionals{
      a: null, b: null, c: null, d: null, e: null,
      f: null, g: null, h: null, i: null, j: null
    };
  }
}
