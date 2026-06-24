struct InnerMost {
  x: Int;
}

struct Inner {
  y: Int;
  innerMost: InnerMost;
}

struct Middle {
  z: Inner;
}

struct Outer {
  w: Middle;
}

contract DeepestTest {
  outer: Outer;

  init() {
    self.outer = Outer{
      w: Middle{
        z: Inner{
          y: 777,
          innerMost: InnerMost{x:42}
        }
      }
    };
  }
}