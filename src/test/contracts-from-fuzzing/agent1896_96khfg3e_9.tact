struct LongStringStruct {
  text1: String;
  text2: String;
  text3: String;
}

contract LongStrings {
  value: LongStringStruct;

  init() {
    self.value = LongStringStruct{
      text1: "alpha",
      text2: "beta",
      text3: "gamma"
    };
  }
}