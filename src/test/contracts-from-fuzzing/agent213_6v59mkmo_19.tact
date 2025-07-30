struct WithStrings {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  s5: String;
}

contract T {
  data: WithStrings;
  init() {
    self.data = WithStrings{
      s1: "a",
      s2: "b",
      s3: "c",
      s4: "d",
      s5: "e"
    };
  }
}