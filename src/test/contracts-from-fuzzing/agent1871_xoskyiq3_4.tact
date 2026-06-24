struct OptionalStruct {
  val: Int?;
  flag: Bool?;
  text: String?;
}

contract OptFieldTest {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{ val: null, flag: null, text: null };
  }
}