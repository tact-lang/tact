struct DeeplyNested {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  label: String;
  number: Int;
}

contract NestTest {
  value: DeeplyNested;

  init() {
    self.value = DeeplyNested{
      inner: InnerStruct{
        flag: true,
        label: "abc",
        number: 42
      }
    };
  }
}