struct ManyOpts {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Cell?;
}

contract HasManyOptions {
  stuff: ManyOpts;

  init() {
    self.stuff = ManyOpts{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}
