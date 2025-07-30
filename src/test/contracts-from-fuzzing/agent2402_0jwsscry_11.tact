struct InnerMost {
  z: Int?;
}

struct Middle {
  midVal: Int;
  deeper: InnerMost;
}

struct OuterMost {
  a: Bool;
  middle: Middle;
}

contract DeeplyNested {
  data: OuterMost;

  init() {
    self.data = OuterMost{
      a: true,
      middle: Middle{
        midVal: 42,
        deeper: InnerMost{
          z: null
        }
      }
    };
  }
}