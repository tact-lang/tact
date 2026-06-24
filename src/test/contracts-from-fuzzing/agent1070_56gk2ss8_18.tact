struct WithStrings {
  s1: String;
  s2: String?;
  s3: String;
}

contract StringCheck {
  val: WithStrings;

  init() {
    self.val = WithStrings {
      s1: "hello",
      s2: null,
      s3: "world"
    };
  }
}