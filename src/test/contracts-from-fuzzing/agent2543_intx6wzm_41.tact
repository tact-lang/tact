struct DeepOptFail {
  a: Int?;
}

struct MiddleOptFail {
  deep: DeepOptFail?;
}

struct TopOptFail {
  middle: MiddleOptFail?;
}

contract NestedOptionsTest {
  root: TopOptFail;
  init() {
    self.root = TopOptFail{
      middle: MiddleOptFail{
        deep: null
      }
    };
  }
}