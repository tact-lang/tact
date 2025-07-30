struct InnerMost {
  z: Int = 5;
}

struct Middle {
  inner: InnerMost;
}

struct Outer {
  middle: Middle;
}

contract NestedDefaults {
  d: Outer;

  init() {
    self.d = Outer{ middle: Middle{ inner: InnerMost{} } };
  }
}