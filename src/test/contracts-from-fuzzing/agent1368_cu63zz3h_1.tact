struct DeepNested {
  value: Int;
  inner: InnerLayer;
}

struct InnerLayer {
  flag: Bool;
  deeper: DeeperLayer;
}

struct DeeperLayer {
  optionalValue: Int?;
  deepFlag: Bool;
}

contract TestNested {
  nested: DeepNested;

  init() {
    self.nested = DeepNested{
      value: 1,
      inner: InnerLayer{
        flag: true,
        deeper: DeeperLayer{
          optionalValue: null,
          deepFlag: false
        }
      }
    };
  }
}
