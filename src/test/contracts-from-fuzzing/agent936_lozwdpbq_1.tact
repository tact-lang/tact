struct DeeplyNested {
  inner: InnerStruct;
}

struct InnerStruct {
  levelTwo: SecondLevelStruct;
}

struct SecondLevelStruct {
  flag: Bool;
  number: Int;
}

contract TestContract {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      inner: InnerStruct{
        levelTwo: SecondLevelStruct{
          flag: true,
          number: 42,
        },
      },
    };
  }
}
