struct EmptyStrings {
  a: String = "";
  b: String = "";
}

contract EmptyStringsTest {
  data: EmptyStrings = EmptyStrings{};
  init() {
    self.data = EmptyStrings{ a:"abc", b:"xyz" };
  }
  receive() {}
}