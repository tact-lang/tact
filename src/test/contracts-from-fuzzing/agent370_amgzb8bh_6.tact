struct LongStrings {
  s1: String;
  s2: String;
}

contract LongStringTest {
  state: LongStrings;

  init() {
    self.state = LongStrings{
      s1: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      s2: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    };
  }
}