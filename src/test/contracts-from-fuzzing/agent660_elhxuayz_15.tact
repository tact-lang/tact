struct ManyStrings {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  s5: String;
}

contract ManyStringsTest {
  storage: ManyStrings;

  init() {
    self.storage = ManyStrings{
      s1: "A",
      s2: "B",
      s3: "C",
      s4: "D",
      s5: "E",
    };
  }
}