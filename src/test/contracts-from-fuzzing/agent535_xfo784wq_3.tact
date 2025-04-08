struct WithOptional {
  val: Int?;
}

contract OptionalStructFieldTest {
  field: WithOptional;

  init() {
    self.field = WithOptional{val: null};
  }
}