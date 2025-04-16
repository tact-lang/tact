struct BigNested {
  s1: String = "1";
  s2: String = "2";
  s3: String = "3";
  s4: String = "4";
  s5: String = "5";
  s6: String = "6";
  s7: String = "7";
  s8: String = "8";
  s9: String = "9";
  s10: String = "10";
}

struct Wrap {
  big: BigNested = BigNested{
    s1: "one",
    s2: "two",
    s3: "three",
    s4: "four",
    s5: "five",
    s6: "six",
    s7: "seven",
    s8: "eight",
    s9: "nine",
    s10: "ten"
  };
}

contract ManyStrings {
  w: Wrap = Wrap{
    big: BigNested{
      s1: "A", s2: "B", s3: "C", s4: "D", s5: "E",
      s6: "F", s7: "G", s8: "H", s9: "I", s10: "J"
    }
  };
  init() {}
}