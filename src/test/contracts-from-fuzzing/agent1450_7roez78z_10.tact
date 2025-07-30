struct StringHeavy {
  s1: String;
  s2: String;
  s3: String;
}

contract ManyStringsTest {
  record: StringHeavy;

  init() {
    self.record = StringHeavy{
      s1: "alpha",
      s2: "beta",
      s3: "gamma",
    };
  }
}