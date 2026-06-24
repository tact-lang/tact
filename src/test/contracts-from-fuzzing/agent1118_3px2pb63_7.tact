struct ComposeStrings {
  a: String;
  b: String?;
}

contract StringFieldsTest {
  data: ComposeStrings;

  init() {
    self.data = ComposeStrings{
      a: "hello",
      b: null
    };
  }
}