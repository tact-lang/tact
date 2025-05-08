struct InnerMost {
  x: Int;
}

struct Middle {
  inner: InnerMost;
}

struct Top {
  m1: Middle;
  m2: Middle;
}

contract DeepNest {
  content: Top;

  init() {
    self.content = Top{
      m1: Middle{inner: InnerMost{x: 12}},
      m2: Middle{inner: InnerMost{x: 34}}
    };
  }
}