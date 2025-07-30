struct OnlyOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract NullInits {
  s: OnlyOpts;

  init() {
    self.s = OnlyOpts{
      a: null,
      b: null,
      c: null,
      d: null
    };
  }
}