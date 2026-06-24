struct OptionalStruct {
  x: Int?;
  y: Bool?;
}

contract OptStructTest {
  field: OptionalStruct?;

  init() {
    self.field = OptionalStruct{x: 5, y: true};
  }
}
