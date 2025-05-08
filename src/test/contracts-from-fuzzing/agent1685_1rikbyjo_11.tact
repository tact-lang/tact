struct MultiOptional {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract MultiOpt {
  var: MultiOptional;

  init() {
    self.var = MultiOptional{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
    };
  }
}
