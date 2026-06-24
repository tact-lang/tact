struct Inner {
  a: Int;
}

struct Middle {
  x: Inner;
}

struct Outer {
  y: Middle;
}

contract ChainNesting {
  z: Outer;

  init() {
    self.z = Outer{
      y: Middle{
        x: Inner{
          a: 99,
        },
      },
    };
  }
}
