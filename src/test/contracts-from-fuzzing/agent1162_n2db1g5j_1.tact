struct NestedStruct {
  a: Int;
  b: Bool;
}

struct OuterStruct {
  ns: NestedStruct;
  flag: Bool;
}

contract DeepContract {
  state: OuterStruct;

  init() {
    self.state = OuterStruct{
      ns: NestedStruct{
        a: 42,
        b: true,
      },
      flag: false,
    };
  }
}