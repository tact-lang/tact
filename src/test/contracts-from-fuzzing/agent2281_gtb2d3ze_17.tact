struct OptWithSerialization {
  a: Int? as int32;
}

contract OptSerialTest {
  val: OptWithSerialization;

  init() {
    self.val = OptWithSerialization{ a: null };
  }
}