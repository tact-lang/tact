struct ManyOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

contract OptionalFields {
  fields: ManyOpts;

  init() {
    self.fields = ManyOpts{
      a: null, b: null, c: null,
      d: null, e: null, f: null
    };
  }
}
