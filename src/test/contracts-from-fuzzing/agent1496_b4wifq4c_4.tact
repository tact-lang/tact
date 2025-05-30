struct OptStruct {
  a: Int?;
  b: Bool?;
  c: Cell?;
  d: String?;
}

contract OptionalStructTest {
  s: OptStruct;

  init() {
    self.s = OptStruct{
      a: null,
      b: true,
      c: null,
      d: "test"
    };
  }
}