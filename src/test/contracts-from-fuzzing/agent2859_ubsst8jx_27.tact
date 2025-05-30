struct WithLongString {
  s1: String;
  s2: String;
  s3: String;
}

contract LongStrings {
  data: WithLongString;

  init() {
    self.data = WithLongString{
      s1: "a very long string a very long string a very long string",
      s2: "another very long string another very long string",
      s3: "third long string third long string third long string"
    };
  }
}