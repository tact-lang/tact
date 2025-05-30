struct InnerMost {
  x: Int;
}

struct Middle {
  inner: InnerMost;
}

struct OuterOptional {
  middle: Middle?;
}

contract OptionalMiddleStructTest {
  data: OuterOptional;

  init() {
    self.data = OuterOptional{
      middle: null
    };
  }
}