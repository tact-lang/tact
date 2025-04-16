struct EmptyStringDefault {
  text: String = "";
}

contract EmptyStringDefaultTest {
  data: EmptyStringDefault;

  init() {
    self.data = EmptyStringDefault{};
  }
}