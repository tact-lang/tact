struct InnerMost {
  x: Int;
}

struct Inner {
  im: InnerMost;
  flag: Bool;
}

contract DeepNestedTest {
  s: Inner;

  init() {
    self.s = Inner{
        im: InnerMost{ x: 42 },
        flag: false
    };
  }
}