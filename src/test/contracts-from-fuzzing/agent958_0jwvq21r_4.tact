struct Inner {
  x: Int;
}

struct Middle {
  y: Inner;
}

struct Outer {
  z: Middle;
}

contract Nested3Levels {
  data: Outer;

  init() {
    self.data = Outer{
      z: Middle{
        y: Inner{
          x: 123,
        },
      },
    };
  }
}
