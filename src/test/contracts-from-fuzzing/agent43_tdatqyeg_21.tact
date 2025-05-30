struct WithStrings {
  a: String;
  b: String?;
}

contract StringsInStruct {
  s: WithStrings;

  init() {
    self.s = WithStrings{ a: "x", b: null };
  }
}