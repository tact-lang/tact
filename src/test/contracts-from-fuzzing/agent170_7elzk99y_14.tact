struct NestedStrings {
  s1: String;
  inner: InnerString;
}

struct InnerString {
  s2: String;
  s3: String;
}

contract NestedStringTest {
  data: NestedStrings;

  init() {
    self.data = NestedStrings{
      s1: "aa",
      inner: InnerString{
        s2: "bb",
        s3: "cc"
      }
    };
  }
}