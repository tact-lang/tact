struct EmptyString {
  s: String;
}

contract EmptyStringTest {
  data: EmptyString;

  init() {
    self.data = EmptyString{ s: "" };
  }
}