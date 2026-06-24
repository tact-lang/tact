struct DeepOptional {
  nestedOpt: Int?;
}

struct Container {
  optStruct: DeepOptional?;
  flag: Bool;
}

contract OptionalNestedStruct {
  s: Container;

  init() {
    self.s = Container{
      optStruct: null,
      flag: true
    };
  }
}