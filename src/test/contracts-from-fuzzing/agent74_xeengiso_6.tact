struct LongNames {
  fieldWithALongNameValue1: Int;
  fieldWithALongNameValue2: String;
  anotherVeryLongFieldNameHere: Bool;
}

contract TestContract {
  data: LongNames;
  init() {
    self.data = LongNames{
      fieldWithALongNameValue1: 42,
      fieldWithALongNameValue2: "hello",
      anotherVeryLongFieldNameHere: true,
    };
  }
}