struct LargeNested {
  level1: Int;
  level2: Int;
  nested: InnerLarge;
}

struct InnerLarge {
  x: Int;
  y: Int;
  z: InnerMost;
}

struct InnerMost {
  foo: Int;
  bar: Int;
}

contract LargeNestedTest {
  data: LargeNested;

  init() {
    self.data = LargeNested{
      level1: 1,
      level2: 2,
      nested: InnerLarge{
        x: 3,
        y: 4,
        z: InnerMost{
          foo: 5,
          bar: 6,
        }
      }
    };
  }
}