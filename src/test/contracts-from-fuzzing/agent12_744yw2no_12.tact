struct StringTest {
  s1: String;
  s2: String;
}

contract TestStringFields {
  texts: StringTest;
  init() {
    self.texts = StringTest{
      s1: "hello",
      s2: "world"
    };
  }
}
