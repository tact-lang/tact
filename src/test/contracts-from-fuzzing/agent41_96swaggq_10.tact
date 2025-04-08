struct LongStringFields {
  text1: String;
  text2: String;
  text3: String;
  text4: String;
  text5: String;
}

contract ManyStrings {
  s: LongStringFields;

  init() {
    self.s = LongStringFields{
      text1: "a",
      text2: "b",
      text3: "c",
      text4: "d",
      text5: "e"
    };
  }
}
