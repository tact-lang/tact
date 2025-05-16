struct MultiLevel {
  a: Int;
  b: Bool;
  c: InnerStruct;
}

struct InnerStruct {
  d: Int;
  e: Bool;
  f: DeepInnerStruct;
}

struct DeepInnerStruct {
  g: Int;
}

contract MultiLevelStructContract {
  data: MultiLevel;

  init() {
    self.data = MultiLevel{
      a: 1,
      b: false,
      c: InnerStruct{
        d: 2,
        e: true,
        f: DeepInnerStruct{g: 3}
      }
    };
  }
}
