struct DeepOpt {
  a: Int?;
}

struct DeepOptNested {
  b: DeepOpt?;
}

contract NestedOptionalStructs {
  data: DeepOptNested;

  init() {
    self.data = DeepOptNested{
      b: null
    };
  }
}