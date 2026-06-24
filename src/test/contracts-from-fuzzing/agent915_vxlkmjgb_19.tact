struct OptFieldStruct {
  foo: Int?;
}

contract OptionalReassignTest {
  sf: OptFieldStruct;

  init() {
    self.sf = OptFieldStruct{ foo: null };
  }

  receive() {
    self.sf = OptFieldStruct{ foo: 999 };
  }
}
