struct ManyStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract Stringy {
  pers: ManyStrings;

  init() {
    self.pers = ManyStrings{
      s1: "first",
      s2: "second",
      s3: "third",
    };
  }
}