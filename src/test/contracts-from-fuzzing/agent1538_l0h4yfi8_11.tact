struct OptionalNestedStruct {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  inner: InnerStruct?;
}

struct InnerStruct {
  sub: SubStruct?;
}

struct SubStruct {
  data: Int?;
}

contract Test {
  storage: OptionalNestedStruct;

  init() {
    self.storage = OptionalNestedStruct{
      f1: null,
      f2: true,
      f3: null,
      inner: InnerStruct{
        sub: SubStruct{ data: 15 }
      }
    };
  }
}