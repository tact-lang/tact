// string serialization widths
struct MultString {
  s1: String;
  s2: String?;
  s3: String;
}

contract TestContract {
  mult: MultString;

  init() {
    self.mult = MultString{
      s1: "abc",
      s2: null,
      s3: "def"
    };
  }
}