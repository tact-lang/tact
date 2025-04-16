struct SpanStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract SpanContract {
  f: SpanStrings;

  init() {
    self.f = SpanStrings{
      s1: "abc",
      s2: "def",
      s3: "ghi"
    };
  }
}