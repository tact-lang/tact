struct WithStrings {
  s1: String;
  s2: String?;
  s3: String;
}

contract StringStructs {
  field: WithStrings;

  init() {
    self.field = WithStrings{
      s1: "Hello",
      s2: null,
      s3: "World"
    };
  }
}