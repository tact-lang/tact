struct InnerMost {
  flag: Bool?;
}

struct Middle {
  inner: InnerMost;
}

struct Outer {
  middle: Middle;
  someInt: Int;
}

contract DeepOptionalsTest {

  field: Outer;

  init() {
    self.field = Outer{
      middle: Middle{
        inner: InnerMost{},
      },
      someInt: 1,
    };
  }
}
