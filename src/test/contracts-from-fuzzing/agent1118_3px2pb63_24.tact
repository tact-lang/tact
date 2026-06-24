struct OptionalSerial {
  a: Int? as uint32;
}

contract OptionalSerializeTest {
  data: OptionalSerial;

  init() {
    self.data = OptionalSerial{
      a: null
    };
  }
}