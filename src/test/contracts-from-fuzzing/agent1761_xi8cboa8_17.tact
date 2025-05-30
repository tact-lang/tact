struct StrucWithStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract StringFieldsTest {
  s: StrucWithStrings;

  init() {
    self.s = StrucWithStrings{
      s1: "A",
      s2: "B",
      s3: "C"
    };
  }
}