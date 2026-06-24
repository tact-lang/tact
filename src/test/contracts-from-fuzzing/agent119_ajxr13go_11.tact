struct StringFields {
  s1: String;
  s2: String;
  s3: String;
}

contract ManyStrings {
  text: StringFields;

  init() {
    self.text = StringFields{
      s1: "alpha",
      s2: "beta",
      s3: "gamma"
    };
  }
}