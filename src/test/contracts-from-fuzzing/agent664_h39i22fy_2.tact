struct DeepNested {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  text: String;
  optInt: Int?;
}

contract Test {
  state: DeepNested;

  init() {
    self.state = DeepNested{
      inner: InnerStruct{
        flag: true,
        text: "data",
        optInt: null,
      },
    };
  }
}