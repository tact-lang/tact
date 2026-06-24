struct OptionalNest {
  inner: Int?;
  flag: Bool;
}

contract OptionalFieldTest {
  testField: OptionalNest;

  init() {
    self.testField = OptionalNest{
      inner: null,
      flag: false,
    };
  }
}