struct InnerMost {
  z: Int?;
}

struct Middle {
  inner: InnerMost;
}

struct Outer {
  middle: Middle?;
}

contract NullableDeepNested {
  state: Outer;

  init() {
    self.state = Outer{
      middle: Middle{
        inner: InnerMost{
          z: null
        }
      }
    };
  }
}