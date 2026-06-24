struct DeepInner {
  d1: Int?;
  d2: Bool = true;
}

struct OuterStruct {
  a: Int = 1;
  b: Bool?;
  c: DeepInner?;
}

contract NestedOptsDefaults {
  state: OuterStruct;

  init() {
    self.state = OuterStruct{
      b: null,
      c: DeepInner{d1: null, d2: false}
    };
  }
}