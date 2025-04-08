struct DeepNested {
  inner1: Int;
  inner2: Bool;
}

struct MiddleNest {
  level1: Int;
  level2: DeepNested;
}

struct Outer {
  outerVal: Int;
  middle: MiddleNest;
}

contract DeepStorage {
  s: Outer;

  init() {
    self.s = Outer{
      outerVal: 10,
      middle: MiddleNest{
        level1: 20,
        level2: DeepNested{ inner1: 30, inner2: false },
      },
    };
  }
}
