struct OptsStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalStructTest {
  s: OptsStruct;

  init() {
    self.s = OptsStruct{
      a: null,
      b: true,
      c: null
    };
  }
}
