struct SingleOptional {
  val: Int?;
}

contract OptionalFieldTest {
  state: SingleOptional;

  init() {
    self.state = SingleOptional{ val: null };
  }
}