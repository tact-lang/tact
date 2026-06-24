struct Texts {
  s1: String;
  s2: String;
  s3: String;
}

contract Test {
  texts: Texts;

  init() {
    self.texts = Texts{
      s1: "abc", s2: "def", s3: "ghi"
    };
  }
}