struct MultiString {
  s1: String;
  s2: String;
  s3: String;
}

contract Str3 {
  d: MultiString;

  init() {
    self.d = MultiString{
      s1: "a",
      s2: "b",
      s3: "c"
    };
  }
}