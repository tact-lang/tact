struct DefaultString {
  a: String = "xyz";
}

contract DefaultStringTest {
  d: DefaultString;

  init() {
    self.d = DefaultString{};
  }
}