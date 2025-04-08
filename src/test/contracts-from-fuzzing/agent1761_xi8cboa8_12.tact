struct OptionalStringStruct {
  s: String?;
  b: Bool;
}

contract OptionalStringTest {
  data: OptionalStringStruct;

  init() {
    self.data = OptionalStringStruct{
      s: null,
      b: true
    };
  }
}