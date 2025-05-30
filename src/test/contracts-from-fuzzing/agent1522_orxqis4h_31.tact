struct WithStrings {
  s1: String;
  s2: String?;
}

contract ConstantStrings {
  data: WithStrings;

  init() {
    self.data = WithStrings{
      s1: "hello",
      s2: null,
    };
  }

  receive() {
    let _ = self.data;
  }
}