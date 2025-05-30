struct LargeStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract Test {
  data: LargeStrings;

  init() {
    self.data = LargeStrings{
      s1: "longstring1",
      s2: "longstring2",
      s3: "longstring3",
    };
  }
}