struct HasStrings {
  s1: String;
  s2: String?;
}

contract StringFields {
  strs: HasStrings;

  init() {
    self.strs = HasStrings{
      s1: "abc",
      s2: null
    };
  }
}