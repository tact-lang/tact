struct OptionalFields {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptionalsTest {
  data: OptionalFields;

  init() {
    self.data = OptionalFields{
      x: null,
      y: true,
      z: null
    };
  }
}