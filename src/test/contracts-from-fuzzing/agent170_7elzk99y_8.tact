struct StringVariants {
  s1: String;
  s2: String?;
  s3: String;
}

contract StringTest {
  data: StringVariants;

  init() {
    self.data = StringVariants{
      s1: "a",
      s2: null,
      s3: "b"
    };
  }
}