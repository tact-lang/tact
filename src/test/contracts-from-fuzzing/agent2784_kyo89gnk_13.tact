struct ManyOpts {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
}

contract OptionalsInStruct {
  field: ManyOpts;

  init() {
    self.field = ManyOpts{
      a: null,
      b: null,
      c: null,
      d: null
    };
  }
}