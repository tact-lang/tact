struct OptionalStruct {
  x: Int;
  y: Bool?;
  z: String?;
}

contract OptionalStructTest {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{
      x: 7,
      y: null,
      z: null,
    };
  }
}