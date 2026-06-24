struct StringNest {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  s5: String;
  s6: String;
  s7: String;
  s8: String;
}

contract LotsOfStrings {
  large: StringNest;

  init() {
    self.large = StringNest{
      s1: "1",
      s2: "2",
      s3: "3",
      s4: "4",
      s5: "5",
      s6: "6",
      s7: "7",
      s8: "8",
    };
  }
}