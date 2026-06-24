struct OptionalsStruct {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
}

contract OptionalFieldsTest {
  data: OptionalsStruct;

  init() {
    self.data = OptionalsStruct{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}
