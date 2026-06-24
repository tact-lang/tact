struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract TestManyOptionalFields {
  nestedOpt: ManyOptionals = ManyOptionals{
    a: null,
    b: true,
    c: null,
    d: null
  };

  init() {
    self.nestedOpt = ManyOptionals{
      a: 12,
      b: null,
      c: "hello",
      d: null
    };
  }
}