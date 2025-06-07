struct OptionalBoolInt {
  flag: Bool?;
  count: Int?;
}

contract OptBoolIntTest {
  data: OptionalBoolInt;

  init() {
    self.data = OptionalBoolInt{
      flag: null,
      count: null,
    };
  }
}