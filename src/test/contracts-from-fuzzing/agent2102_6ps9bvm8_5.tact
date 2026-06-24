struct Opts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract OptionalFields {
  opts: Opts;

  init() {
    self.opts = Opts{
      a: null,
      b: null,
      c: null,
      d: null
    };
  }
}