struct InnerMost {
  a: Int;
}

struct InnerMid {
  x: Int;
  y: InnerMost;
  optZ: Bool?;
}

struct Outer {
  one: Bool;
  mid: InnerMid;
}

contract DeepComplexTest {
  data: Outer;

  init() {
    self.data = Outer{
      one: true,
      mid: InnerMid{
        x: 77,
        y: InnerMost{ a: 33 },
        optZ: null
      }
    };
  }
}
