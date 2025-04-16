struct OptionalStruct {
  x: Int?;
  y: Bool?;
}

contract OptionalFieldsTest {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{ x: null, y: true };
  }
}