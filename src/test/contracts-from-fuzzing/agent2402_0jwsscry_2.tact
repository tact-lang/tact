struct DeepNested {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  optVal: MiddleStruct?;
}

struct MiddleStruct {
  number: Int;
  nested: LeafStruct;
}

struct LeafStruct {
  text: String;
  optFlag: Bool?;
}

contract UseDeepNested {
  state: DeepNested;

  init() {
    self.state = DeepNested{
      inner: InnerStruct{
        flag: true,
        optVal: MiddleStruct{
          number: 123,
          nested: LeafStruct{
            text: "abc",
            optFlag: null
          }
        }
      }
    };
  }
}