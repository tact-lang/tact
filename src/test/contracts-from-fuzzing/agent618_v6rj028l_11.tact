struct MultiOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int;
}

contract OptMix {
  data: MultiOptional;

  init() {
    self.data = MultiOptional{
      a: null,
      b: null,
      c: null,
      d: 123
    };
  }
}
