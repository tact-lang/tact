struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
}

contract Opt {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      a: null,
      b: true,
      c: 123,
      d: null
    };
  }
}
