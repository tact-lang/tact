struct OptionalStruct {
  val: Int?;
}

contract OptStructTest {
  os: OptionalStruct;

  init() {
    self.os = OptionalStruct{ val: null };
  }
}