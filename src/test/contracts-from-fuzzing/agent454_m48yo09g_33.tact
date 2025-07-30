struct Inner {
  x: Int;
}

struct Middle {
  inner: Inner;
}

struct Outer {
  middle: Middle;
}

contract MultiLevelNest {
  layered: Outer;
  init() {
    self.layered = Outer{ middle: Middle{ inner: Inner{ x: 42 } } };
  }
}