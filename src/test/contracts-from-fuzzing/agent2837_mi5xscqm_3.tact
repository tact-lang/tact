struct DeeplyNested {
  a: Int;
  b: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: Bool;
}

contract TestDeepNested {
  d: DeeplyNested;
  init() {
    self.d = DeeplyNested{
      a: 1,
      b: InnerStruct{ x: 2, y: true }
    };
  }
}