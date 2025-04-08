struct StrStruct {
  s1: String;
  s2: String;
}

contract TestStrings {
  data: StrStruct;

  init() {
    self.data = StrStruct{
      s1: "Hello",
      s2: "World",
    };
  }
}