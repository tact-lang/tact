struct JustStrings {
  s1: String;
  s2: String;
}

contract StrFields {
  strs: JustStrings;

  init() {
    self.strs = JustStrings{s1: "foo", s2: "bar"};
  }
}