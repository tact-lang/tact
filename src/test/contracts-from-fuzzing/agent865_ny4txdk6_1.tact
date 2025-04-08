struct DeepNested {
  subfield: SubStruct;
}

struct SubStruct {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  number: Int;
  text: String;
}

contract Test {
  nested: DeepNested;

  init() {
    self.nested = DeepNested{
      subfield: SubStruct{
        inner: InnerStruct{
          flag: true,
          number: 42,
          text: "hello"
        }
      }
    };
  }
}
