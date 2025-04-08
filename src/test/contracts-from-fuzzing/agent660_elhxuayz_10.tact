struct StringStruct {
  s1: String;
  s2: String;
}

contract StringFieldsTest {
  texts: StringStruct;

  init() {
    self.texts = StringStruct{
      s1: "hello",
      s2: "world",
    };
  }
}