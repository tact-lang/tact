struct MultiStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract StringsTest {
  data: MultiStrings;
  init() {
    self.data = MultiStrings{
      s1: "abc",
      s2: "def",
      s3: "ghi"
    };
  }
}