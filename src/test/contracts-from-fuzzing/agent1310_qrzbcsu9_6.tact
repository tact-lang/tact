struct OnlyStrings {
  s1: String;
  s2: String?;
}

contract StringContract {
  data: OnlyStrings;
  init() {
    self.data = OnlyStrings{
      s1: "hello",
      s2: null
    };
  }
}