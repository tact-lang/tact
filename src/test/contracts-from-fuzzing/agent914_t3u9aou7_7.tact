struct DefaultOptionalTest {
  x: Int?;
  y: Bool?;
  z: Address?;
}

contract OptionalStructField {
  s: DefaultOptionalTest;

  init() {
    self.s = DefaultOptionalTest{x: null, y: true, z: null};
  }
}