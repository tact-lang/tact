struct LotsOpts {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Bool?;
  e: Address?;
  f: Address?;
  g: String?;
  h: String?;
  i: Cell?;
  j: Cell?;
  k: Slice?;
  l: Slice?;
  m: String?;
  n: String?;
}

contract Test13 {
  val: LotsOpts;

  init() {
    self.val = LotsOpts{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
      h: null,
      i: null,
      j: null,
      k: null,
      l: null,
      m: null,
      n: null,
    };
  }
}
